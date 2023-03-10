variable "kubernetes_config_file" {
  type        = string
  description = "The Kubernetes config-file to be used"
  default     = "~/.kube/config"
}

variable "kong_enabled" {
  type        = bool
  default     = false
  description = "Enable Kong Release"
}
variable "kong_ee_release_config" {
  type = object({})
  default = {

    kong_admin_enabled = false
    kong_database_type = "off"
    kong_db_name       = ""
    kong_db_host       = ""
    kong_db_port       = ""
    kong_db_username   = ""
    kong_db_password   = ""
    kong_db_schema     = ""
  }
}