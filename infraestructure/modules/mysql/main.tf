resource "azurerm_private_dns_zone" "mysql_dns" {
  name                = "${var.env_prefix}${replace(var.project, "-", "")}.mysql.database.azure.com"
  resource_group_name = var.reource_group_name
}

resource "azurerm_private_dns_zone_virtual_network_link" "mysql_dns_link" {
  name                  = "${var.env_prefix}${replace(var.project, "-", "")}-link.com"
  private_dns_zone_name = azurerm_private_dns_zone.mysql_dns.name
  virtual_network_id    = var.network_id
  resource_group_name   = var.reource_group_name

  depends_on = [ azurerm_private_dns_zone.mysql_dns ]
}

resource "azurerm_mysql_flexible_server" "main" {
  name                   = "${var.env_prefix}${replace(var.project, "-", "")}"
  resource_group_name    = var.reource_group_name
  location               = var.location
  administrator_login    = var.administrator_login
  administrator_password = var.administrator_password
  backup_retention_days  = 7
  delegated_subnet_id    = var.subnet_id
  sku_name               = var.sku_name
  zone                   = 2

  depends_on = [azurerm_private_dns_zone_virtual_network_link.mysql_dns_link]
}
