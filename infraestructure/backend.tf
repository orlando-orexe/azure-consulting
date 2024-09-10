terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3.0"
    }
  }
  backend "azurerm" {
      resource_group_name  = "almonds.com-live"
      storage_account_name = "tfstatealmonds"
      container_name       = "tfstate"
      key                  = "almondsv2.tfstate"
  }

  
}
