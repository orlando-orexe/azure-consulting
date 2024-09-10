resource "azurerm_virtual_network" "main" {
  name                = "${var.env_prefix}-${var.project}-vnet"
  address_space       = var.address_space
  location            = var.location
  resource_group_name = var.resource_group_name
}

resource "azurerm_subnet" "main" {
  name                 = "${var.env_prefix}-${var.project}-subnet"
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.main.name
  address_prefixes     = var.address_prefixes
}
