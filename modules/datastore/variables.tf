variable postgresql_enabled {
  type = bool
  default = false
}
variable postgresql_release_configuration {
    type = map
    default = {
        global_postgresql_auth_postgresPassword = ""
    }
}
