module "apigw" {
  source = "../../modules/apigw"

  kong_ee_enabled = true

  kong_ee_release_configuration = {
    image_tag = "3.1"
    image_repository = ""
    admin_enabled = false
    postgresql_auth_username = "kong"
    postgresql_auth_password = "kong"
    admin_ingress_hostname = "localhost"
    admin_ingress_tls = "localhost"
    manager_ingress_hostname = "localhost"
    manager_ingress_tls = "localhost"
    portal_ingress_hostname = "localhost"
    portal_ingress_tls = "localhost"
    admin_gui_auth_conf_secret = "admin-gui-auth-conf-secret"
  }
}

resource "kubernetes_secret" "kong_session_config" {
  metadata {
    name = "kong-session-config"
    namespace = "kong"
  }

  data = {
    "admin_gui_session_conf" = jsonencode({
        "cookie_name": "kookie"
        "secret": "changeme" 
    })
  }

  type = "Opaque"
}

resource "kubernetes_secret" "kong_enterprise_license" {
  metadata {
    name = "kong-enterprise-license"
    namespace = "kong"
  }

  data = {
    "license" = jsonencode({})
  }

  type = "Opaque"
}

resource "kubernetes_secret" "kong_enterprise_superuser_password" {
  metadata {
    name = "kong-enterprise-superuser-password"
    namespace = "kong"
  }

  data = {
    "password" = "password"
  }

  type = "Opaque"
}

resource "kubernetes_secret" "kong_postgres" {
  metadata {
    name = "kong-postrgresql"
    namespace = "kong"
  }

  data = {
    "password" = "kong"
  }

  type = "Opaque"
}

resource "kubernetes_secret" "admin_gui_auth_conf_secret" {
  metadata {
    name = "admin-gui-auth-conf-secret"
    namespace = "kong"
  }

  data = {
    "password" = "password"
  }

  type = "Opaque"
}

