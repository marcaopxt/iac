terraform {
  required_providers {
    “azurerm” = {
      source = “hashicorp/azurerm”
      version = “>= 2.56.0”
    }
  }
}
provider {
  tenant_id = var.tenant_id
  subscription_id = var.subscription_id
  client_id = var.client_id
  client_secret = var.client_secret
  features {}
}
resource "azurerm_resource_group" "aks_demo_rg" {
  name     = "aks-free-tier-demo"
  location = "East US"
}

resource "azurerm_kubernetes_cluster" "aks_free_tier_demo" {
  name                = "aks-free-tier-demo"
  location            = azurerm_resource_group.aks_demo_rg.location
  resource_group_name = azurerm_resource_group.aks_demo_rg.name
  dns_prefix          = "aks-free"

  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_D2_v2"
  }

  identity {
    type = "SystemAssigned"
  }

  tags = {
    Environment = "Production"
  }
}

output "client_certificate" {
  value     = azurerm_kubernetes_cluster.aks_free_tier_demo.kube_config.0.client_certificate
  sensitive = true
}

output "kube_config" {
  value = azurerm_kubernetes_cluster.aks_free_tier_demo.kube_config_raw

  sensitive = true
}
