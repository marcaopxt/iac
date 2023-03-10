variable kong_ee_enabled {
  type = bool
  default = false
}
variable kong_ee_release_configuration {
  type = map
  default = {
    image_repository = "kong/kong-gateway"
    image_tag = "3.1"
    admin_enabled = false
    postgres_auth_username = ""
    postgres_auth_password = ""
    portal_ingress_hostname = "localhost"
  }
}
variable kong_enabled {
  type = bool
  default = false
  description = "Enable Kong Release"
}
variable kong_release_configuration {
  type = map
  default = {
    kong_image_repository = "kong/kong-gateway"
    kong_image_tag = "3.1"
    kong_admin_enabled = false
    kong_database_type = "off" 
    kong_db_name = ""
    kong_db_host = ""
    kong_db_port = ""
    kong_db_username = ""
    kong_db_password = ""
    kong_db_schema = ""
  }
}