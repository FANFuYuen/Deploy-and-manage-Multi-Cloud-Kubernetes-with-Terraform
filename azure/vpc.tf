# Create a virtual network within the resource group
resource "azurerm_virtual_network" "k8s-network" {
  name                = "k8s-network"
  resource_group_name = azurerm_resource_group.default.name
  location            = azurerm_resource_group.default.location
  address_space       = ["10.0.0.0/16"]
}

resource "azurerm_subnet" "subneta" {
  name                 = "k8s-subneta"
  resource_group_name  = azurerm_resource_group.default.name
  virtual_network_name = azurerm_virtual_network.k8s-network.name
  address_prefixes     = ["10.0.1.0/24"]
}

resource "azurerm_subnet" "subnetb" {
  name                 = "k8s-subnetb"
  resource_group_name  = azurerm_resource_group.default.name
  virtual_network_name = azurerm_virtual_network.k8s-network.name
  address_prefixes     = ["10.0.0.0/24"]
}