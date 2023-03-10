terraform {
  #    backend "gcs" {
  #        bucket = "terraform-state"
  #        prefix = "local-kind.tfstate" 
  #    }"
  #  backend "local" {
  #    path = "/.states/kind.tfstate"
  #  }
  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 2.18"
    }
    kind = {
      source  = "tehcyx/kind"
      version = "0.0.16"
    }
    helm = {
      source  = "hashicorp/helm"
      version = "~> 2.9"
    }
  }
}
