module "datastore" {
  source = "../../modules/datastore"

  postgresql_enabled = true

  postgresql_release_configuration = {
    global_postgresql_auth_postgresPassword = "password"
  }
}