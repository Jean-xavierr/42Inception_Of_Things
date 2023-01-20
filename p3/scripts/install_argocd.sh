#!/bin/sh
# https://argo-cd.readthedocs.io/en/stable/getting_started/#1-install-argo-cd
k3d cluster create
kubectl create namespace argocd
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
kubectl port-forward -n argocd svc/argocd-server 8080:443

# login using the CLI ArgoCD
# admin account - get secret with command-line :
# kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d; echo

kubectl create namespace dev