variable "prefix" {
  description = "A prefix used for all resources in this example"
  default = ""
}

variable "location" {
  description = "The Azure Region in which all resources in this example should be provisioned"
  default = "East US"
}
variable "tenant_id" {
  type = string
  description = ""
  default = ""
}
variable "subscription_id" {
  type = string
  description = ""
  default = ""
}
variable "cluster_name" {
  type = string
  description = ""
  default = ""
}
variable "client_id" {
  type = string
  description = ""
  default = ""
}
variable "client_secret" {
  type = string
  description = ""
  default = ""
}
