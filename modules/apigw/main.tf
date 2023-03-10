# helm repo add kong https://charts.konghq.com  
resource "helm_release" "kong_ee" { 
    count                       = var.kong_ee_enabled == false ? 0 : 1
    name                        = "kong"
    namespace                   = "kong"
    chart                       = "kong"
    repository                  = "https://charts.konghq.com"
    
    version                     = "2.16.5"
    reuse_values                = true
    recreate_pods               = true
    force_update                = true
    create_namespace            = true

    values = [ templatefile("${path.module}/templates/kong-ee-full-values.tpl.yaml", var.kong_ee_release_configuration) ]

    set {
        name = "image.tag"
        value = var.kong_ee_release_configuration.image_tag
    }
    set {
        name = "admin.enabled"
        value = var.kong_ee_release_configuration.admin_enabled
    }
    set {
        name = "postgresql.auth.username"
        value = var.kong_ee_release_configuration.postgresql_auth_username
    }
    set {
        name = "postgresql.auth.password"
        value = var.kong_ee_release_configuration.postgresql_auth_password
    }
    set {
        name = "admin.ingress.hostname"
        value = var.kong_ee_release_configuration.admin_ingress_hostname
    }
     set {
        name = "admin.ingress.tls"
        value = var.kong_ee_release_configuration.admin_ingress_tls
    }
    set {
        name = "manager.ingress.hostname"
        value = var.kong_ee_release_configuration.manager_ingress_hostname
    }
    set {
        name = "manager.ingress.tls"
        value = var.kong_ee_release_configuration.manager_ingress_tls
    }       
    set {
        name = "portal.ingress.hostname"
        value = var.kong_ee_release_configuration.portal_ingress_hostname
    }
    set {
        name = "portal.ingress.tls"
        value = var.kong_ee_release_configuration.portal_ingress_tls
    }
    set {
        name = "portalapi.ingress.hostname"
        value = var.kong_ee_release_configuration.portal_ingress_hostname
    }
    set {
        name = "portalapi.ingress.tls"
        value = var.kong_ee_release_configuration.portal_ingress_tls
    }
    set {
        name = "enterprise.rbac.admin_gui_auth_conf_secret"
        value = var.kong_ee_release_configuration.admin_gui_auth_conf_secret
    }
}