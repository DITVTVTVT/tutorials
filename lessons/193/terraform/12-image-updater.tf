# helm repo add argo https://argoproj.github.io/argo-helm
# helm repo update
# helm install updater -n argocd argo/argocd-image-updater --version 0.11.0 -f terraform/values/image-updater.yaml

resource "helm_release" "updater" {
  name             = "updater"
  repository       = "https://argoproj.github.io/argo-helm" # Official Chart Repo
  chart            = "argocd-image-updater"                 # Official Chart Name
  namespace        = "argocd"
  timeout          = 500
  version          = "0.11.0"
  create_namespace = true
  values           = [file("values/image-updater.yaml")]
}