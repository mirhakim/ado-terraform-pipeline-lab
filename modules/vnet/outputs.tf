output "name" {
  description = "VNet name"
  value       = azurerm_virtual_network.this.name
}

output "id" {
  description = "VNet ID"
  value       = azurerm_virtual_network.this.id
}
