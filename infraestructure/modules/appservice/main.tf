resource "azurerm_service_plan" "main" {
  name                = "${var.env_prefix}-service-plan"
  resource_group_name = var.reource_group_name
  location            = var.location
  os_type             = "Linux"
  sku_name            = var.sku_name
}

resource "azurerm_linux_web_app" "example" {
  name                = "${var.env_prefix}-${var.project}-appservice"
  resource_group_name = var.reource_group_name
  location            = var.location
  service_plan_id     = azurerm_service_plan.main.id

  site_config {
    application_stack {
      # docker_image_name = "${var.docker_image}:${var.docker_tag}"
      docker_image_name = "appsvc/staticsite:latest"
      docker_registry_url = "https://mcr.microsoft.com"
      # docker_registry_url = "https://almondsnextacr.azurecr.io"
    }
  }

  virtual_network_subnet_id = var.subnet_id

  depends_on = [ azurerm_service_plan.main ]
}