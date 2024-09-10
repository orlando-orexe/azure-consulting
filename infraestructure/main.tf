provider "azurerm" {
  features {}
}

data "azurerm_resource_group" "main" {
  name = "almonds.com-live"
}

resource "azurerm_virtual_network" "main" {
  name                = "${var.env_prefix}-${var.project}-vnet"
  address_space       = ["10.0.0.0/16"]
  location            = var.location
  resource_group_name = data.azurerm_resource_group.main.name
}

resource "azurerm_subnet" "main" {
  name                 = "${var.env_prefix}-${var.project}-subnet"
  resource_group_name  = data.azurerm_resource_group.main.name
  virtual_network_name = azurerm_virtual_network.main.name
  address_prefixes     = ["10.0.2.0/24"]
  service_endpoints    = ["Microsoft.Storage"]
  delegation {
    name = "fs"
    service_delegation {
      name = "Microsoft.DBforMySQL/flexibleServers"
      actions = [
        "Microsoft.Network/virtualNetworks/subnets/join/action",
      ]
    }
  }
}

resource "azurerm_subnet" "app-service" {
  name                 = "${var.env_prefix}-${var.project}-appservice-subnet"
  resource_group_name  = data.azurerm_resource_group.main.name
  virtual_network_name = azurerm_virtual_network.main.name
  address_prefixes     = ["10.0.3.0/24"]
  delegation {
    name = "appservice-delegation"
    service_delegation {
      name = "Microsoft.Web/serverFarms"
      actions = [
        "Microsoft.Network/virtualNetworks/subnets/join/action",
      ]
    }
  }
}

# resource "azurerm_storage_account" "main" {
#   name                     = "${var.env_prefix}${replace(var.project, "-", "")}storage"
#   resource_group_name      = data.azurerm_resource_group.main.name
#   location                 = data.azurerm_resource_group.main.location
#   account_tier             = "Standard"
#   account_replication_type = "LRS"
# }

# resource "azurerm_storage_share" "main" {
#   name                 = "app-files"
#   storage_account_name = azurerm_storage_account.main.name
#   quota                = 50  # Size in GB
# }

# resource "azurerm_storage_container" "certificate_container" {
#   name                  = "certificate"
#   storage_account_name  = azurerm_storage_account.main.name
#   container_access_type = "private"
# }

# resource "azurerm_app_service_plan" "main" {
#   name                = "${var.env_prefix}-${var.project}-asp"
#   location            = data.azurerm_resource_group.main.location
#   resource_group_name = data.azurerm_resource_group.main.name

#   sku {
#     tier = "PremiumV3"
#     size = var.sku_name  # e.g., "P1v3"
#   }

#   os_type = "Linux"
# }

# resource "azurerm_app_service" "main" {
#   name                = "${var.env_prefix}-${var.project}-appservice"
#   location            = data.azurerm_resource_group.main.location
#   resource_group_name = data.azurerm_resource_group.main.name
#   app_service_plan_id = azurerm_app_service_plan.main.id

#   app_settings = {
#     "WEBSITES_ENABLE_APP_SERVICE_STORAGE" = "true"
#   }

#   site_config {
#     always_on       = true
#     linux_fx_version = "DOCKER|hello-world:latest"  # Docker image

#     # Configuration to mount Azure File Share
#     virtual_application {
#       physical_path = "/"
#       virtual_path  = "/opt/certificate"
#     }
#   }

#   identity {
#     type = "SystemAssigned"
#   }
# }

# resource "azurerm_mysql_flexible_server" "main" {
#   name                   = "${var.env_prefix}${replace(var.project, "-", "")}"
#   resource_group_name    = data.azurerm_resource_group.main.name
#   location               = data.azurerm_resource_group.main.location
#   administrator_login    = var.administrator_login
#   administrator_password = var.administrator_password
#   backup_retention_days  = 7
#   delegated_subnet_id    = azurerm_subnet.main.id
#   sku_name               = var.sku_name
#   zone                   = 2

#   depends_on = [azurerm_virtual_network.main]
# }

# resource "azurerm_mysql_flexible_server_firewall_rule" "my_ip" {
#   name                = "AllowMyIP"
#   resource_group_name = data.azurerm_resource_group.main.name
#   server_name         = azurerm_mysql_flexible_server.main.name
#   start_ip_address    = var.my_ip_address
#   end_ip_address      = var.my_ip_address
# }

# output "mysql_fqdn" {
#   value = azurerm_mysql_flexible_server.main.fqdn
# }