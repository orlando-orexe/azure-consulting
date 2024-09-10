module "mysql_dev" {
  source     = "./modules/mysql"
  env_prefix = "dev"
  project    = var.project
  location   = var.location
  administrator_login = var.dev_database_username
  administrator_password = var.dev_database_password
  reource_group_name = data.azurerm_resource_group.main.name

  subnet_id = azurerm_subnet.main.id
  network_id = azurerm_virtual_network.main.id
  sku_name = var.dev_sku_name

  depends_on = [ azurerm_subnet.main, azurerm_virtual_network.main ]
}

module "mysql_qa" {
  source     = "./modules/mysql"
  env_prefix = "qa"
  project    = var.project
  location   = var.location
  administrator_login = var.qa_database_username
  administrator_password = var.qa_database_password
  reource_group_name = data.azurerm_resource_group.main.name

  subnet_id = azurerm_subnet.main.id
  network_id = azurerm_virtual_network.main.id
  sku_name = var.qa_sku_name

  depends_on = [ azurerm_subnet.main, azurerm_virtual_network.main ]
}
