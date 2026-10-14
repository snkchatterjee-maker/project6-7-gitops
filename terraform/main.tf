resource "kubernetes_namespace_v1" "argocd" {
  metadata {
    name = var.argocd_namespace
    labels = {
      "app.kubernetes.io/managed-by" = "terraform"
    }
  }
}

resource "helm_release" "argocd" {
  name       = var.argocd_release_name
  repository = "https://argoproj.github.io/argo-helm"
  chart      = "argo-cd"
  namespace  = kubernetes_namespace_v1.argocd.metadata[0].name

  # Keep the dashboard accessible through local port-forwarding.
  set {
    name  = "server.service.type"
    value = "ClusterIP"
  }

  depends_on = [
    kubernetes_namespace_v1.argocd
  ]
}