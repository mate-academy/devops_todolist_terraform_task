output "subnet_id" {
  description = "ID створеної підмережі"
  value       = azurerm_subnet.subnet.id
}

output "public_ip_id" {
  description = "ID створеного публічного IP"
  value       = azurerm_public_ip.pip.id
}

output "public_ip_address" {
  description = "Public IP address"
  value       = azurerm_public_ip.pip.ip_address
}