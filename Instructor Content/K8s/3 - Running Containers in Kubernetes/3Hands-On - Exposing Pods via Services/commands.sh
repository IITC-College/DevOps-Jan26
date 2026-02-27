#!/bin/bash

# --------------------------------------------
# Kubernetes Service Stability Lab
# --------------------------------------------

# 1️⃣ Check existing Pods
# Lists running Pods (verify nginx exists)
kubectl get pods

# --------------------------------------------

# 2️⃣ Create Service for nginx Pod
# Expose nginx Pod using NodePort
# Creates a stable ClusterIP
kubectl expose pod nginx --type=NodePort --port=80

# Verify Service creation
# Observe ClusterIP and Port 80
kubectl get services

# --------------------------------------------

# 3️⃣ Create temporary Alpine Pod for testing
# Interactive Pod for internal communication tests
kubectl run alpine -it --image=alpine --restart=Never -- sh

# Inside Alpine container run:
# apk update
# apk add curl
# curl <cluster-ip>
# (ClusterIP routes traffic to nginx Pod)

# --------------------------------------------

# 4️⃣ Compare Pod IP vs Service IP
# Check nginx Pod IP (dynamic)
kubectl describe pod nginx

# --------------------------------------------

# 5️⃣ Delete nginx Pod
# Service remains but request will fail (no backend Pod)
kubectl delete pod nginx

# If testing:
# curl <cluster-ip>  -> should fail

# --------------------------------------------

# 6️⃣ Recreate nginx Pod
# New Pod gets new IP
# Service automatically reconnects
kubectl run nginx --image=nginx --restart=Never

# Test again from inside cluster:
# curl <cluster-ip>
# or better:
# curl nginx   (DNS resolution)

# --------------------------------------------

# 7️⃣ Cleanup

# Exit Alpine shell first (if still inside):
# exit

# Delete Service
kubectl delete service nginx

# Delete Pods
kubectl delete pod alpine
kubectl delete pod nginx

# Final verification
kubectl get pods
kubectl get services

# --------------------------------------------
# End of Lab
# --------------------------------------------