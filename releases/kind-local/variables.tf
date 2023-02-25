variable "kubernetes_config_file" {
  type        = string
  description = "The Kubernetes config-file to be used"
  default     = "~/.kube/config"
}