resource "azurerm_container_registry" "acr" {
  name                = "${replace(var.project, "-", "")}acr"
  resource_group_name = data.azurerm_resource_group.main.name
  location            = var.location
  sku                 = "Premium"
  admin_enabled       = false
}