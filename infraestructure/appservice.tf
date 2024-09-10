module "dev_appservice" {
  source     = "./modules/appservice"
  env_prefix = "dev"
  project    = var.project
  location   = "East US 2"
  reource_group_name = data.azurerm_resource_group.main.name

  subnet_id = azurerm_subnet.app-service.id
  network_id = azurerm_virtual_network.main.id
  sku_name = "P1v2"

  docker_image = "deutsch.la.almonds.next"
  docker_tag = "prod-39-20240712200340"

  depends_on = [ azurerm_subnet.app-service, azurerm_virtual_network.main ]
}