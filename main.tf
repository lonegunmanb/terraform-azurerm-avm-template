data "azurerm_resource_group" "parent" {
  count = var.location == null ? 1 : 0
  name  = var.resource_group_name
}

resource "azurerm_virtual_network" "vnet" {
  address_space       = ["10.0.0.0/16"]
  location            = data.azurerm_resource_group.parent[0].location
  name                = var.name
  resource_group_name = data.azurerm_resource_group.parent[0].name
}