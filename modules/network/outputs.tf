output "subnet_id" {
  value       = azurerm_subnet.subnet.id
  description = "The ID of the subnet"
}

output "public_ip_id" {
  value       = azurerm_public_ip.public_ip.id
  description = "The ID of the public IP address"
}

output "public_ip_address" {
  value       = azurerm_public_ip.public_ip.ip_address
  description = "The public IP address"
}

output "public_ip_fqdn" {
  value       = azurerm_public_ip.public_ip.fqdn
  description = "The fully qualified domain name (FQDN) of the public IP address"
}
