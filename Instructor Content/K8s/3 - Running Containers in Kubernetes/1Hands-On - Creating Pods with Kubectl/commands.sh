# Check kubernetes version
kubectl version

# Check current context
kubectl config current-context

# in case of multiple contexts, you can switch between them
# kubectl config use-context <context-name>
kubectl config use-context minikube

# Check context again
kubectl config current-context

# Get help for a command
kubectl run --help

# Create a pod:
kubectl run nginx \
  --image=nginx:1.27.0