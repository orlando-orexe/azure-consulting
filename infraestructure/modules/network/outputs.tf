output "virtual_network_id" {
  description = "The ID of the Virtual Network"
  value       = azurerm_virtual_network.main.id
}

output "subnet_id" {
  description = "The ID of the Subnet"
  value       = azurerm_subnet.main.id
}
