output "subnet_id" {
  description = "ID of the internal subnet"
  value       = azurerm_subnet.internal.id
}

output "public_ip_id" {
  description = "ID of the public IP address"
  value       = azurerm_public_ip.public_ip.id
}

output "public_ip_fqdn" {
  description = "Fully qualified DNS name for the public IP"
  value       = azurerm_public_ip.public_ip.fqdn
}