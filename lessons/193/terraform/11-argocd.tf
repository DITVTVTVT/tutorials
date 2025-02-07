# helm repo add argo https://argoproj.github.io/argo-helm
# helm repo update
# helm install argocd -n argocd --create-namespace argo/argo-cd --version 7.3.11 -f terraform/values/argocd.yaml

resource "helm_release" "argocd" {
  name             = "argocd"

  repository       = "https://argoproj.github.io/argo-helm" # Official Chart Repo
  chart            = "argo-cd"                              # Official Chart Name
  namespace        = "argocd"
  timeout          = 600
  version          = "7.3.11"
  create_namespace = true

  values           = [file("values/argocd.yaml")]
}