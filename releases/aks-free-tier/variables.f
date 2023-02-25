variable "prefix" {
  description = "A prefix used for all resources in this example"
}

variable "location" {
  description = "The Azure Region in which all resources in this example should be provisioned"
}
variable "tenant_id" {
  type = string
  description = ""
}
variable "subscription_id" {
  type = string
  description = ""
}
variable "cluster_name" {
  type = string
  description = ""
}
variable "client_id" {
  type = string
  description = ""
}
variable "client_secret" {
  type = string
  description = ""
}
