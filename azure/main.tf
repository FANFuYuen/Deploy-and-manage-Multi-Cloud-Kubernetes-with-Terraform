# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

resource "random_pet" "prefix" {}

provider "azurerm" {
  features {}
}

locals {
  azure_credentials = jsondecode(file("..//key/azure.rbac.txt"))
}

resource "azurerm_resource_group" "default" {
  name     = "${random_pet.prefix.id}-aks"
  location = "West US 2"

  tags = {
    environment = "Demo"
  }
}

resource "azurerm_kubernetes_cluster" "default" {
  name                = "${random_pet.prefix.id}-aks"
  location            = azurerm_resource_group.default.location
  resource_group_name = azurerm_resource_group.default.name
  dns_prefix          = "${random_pet.prefix.id}-k8s"
  kubernetes_version  = "1.29.2"

  network_profile {
    network_plugin     = "azure"
    network_policy     = "calico"
    dns_service_ip     = "10.0.3.10"
    service_cidr       = "10.0.3.0/24"
  }

  default_node_pool {
    name            = "defyault"
    node_count      = 2
    vm_size         = "Standard_D2_v2"
    os_disk_size_gb = 30
    vnet_subnet_id  = azurerm_subnet.subneta.id
  }

  service_principal {
    client_id     = local.azure_credentials.appId
    client_secret = local.azure_credentials.password
  }

  role_based_access_control_enabled = true

  tags = {
    environment = "Demo"
  }
}
