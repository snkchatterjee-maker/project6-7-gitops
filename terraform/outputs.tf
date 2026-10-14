output "argocd_namespace" {
  description = "Namespace containing Argo CD"
  value       = kubernetes_namespace_v1.argocd.metadata[0].name
}

output "argocd_release_name" {
  description = "Argo CD Helm release"
  value       = helm_release.argocd.name
}

output "argocd_release_status" {
  description = "Current Helm release status"
  value       = helm_release.argocd.status
}