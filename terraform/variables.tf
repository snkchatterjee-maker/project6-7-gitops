variable "argocd_namespace" {
  description = "Namespace used to install Argo CD"
  type        = string
  default     = "argocd"
}

variable "argocd_release_name" {
  description = "Helm release name for Argo CD"
  type        = string
  default     = "argocd"
}