#helm repo add bitnami https://charts.bitnami.com/bitnami
resource "helm_release" "postgresql" {
    count                       = var.postgresql_enabled == false ? 0 : 1
    name                        = "postgresql"
    namespace                   = "postgresql"
    chart                       = "postgresql"
    repository                  = "https://charts.bitnami.com/bitnami"
    
    version                     = "12.2.2 "
    reuse_values                = true
    recreate_pods               = true
    force_update                = true
    create_namespace            = true

    values = [ templatefile("${path.module}/templates/postgresql-values.tpl.yaml", var.postgresql_release_configuration) ]

    set {
        name = "global.postgresql.auth.postgresPassword"
        value = var.postgresql_release_configuration.global_postgresql_auth_postgresPassword
    }
}
