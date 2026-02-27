kubectl version

kubectl config current-context

kubectl config use-context minikube


kubectl run nginx \
  --image=nginx:1.27.0

kubectl get pods

kubectl delete pod nginx

kubectl get pods

kubectl run alpine \
  -it \
  --image=alpine:3.20 \
  -- sh