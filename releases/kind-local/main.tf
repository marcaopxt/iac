provider "kubernetes" {
  config_path    = "~/.kube/config"
  config_context = "kind-local-kind"
#  host           = "https://localhost:6443"
}
provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"
  }

  # localhost registry with password protection
  #    registry {
  #        url = "oci://localhost:5000"
  #        username = "username"
  #        password = "password"
  #    }
}


provider "kind" {

}

