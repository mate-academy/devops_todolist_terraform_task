output "subnet_id" {
  description = "ID of the subnet"
  value       = azurerm_subnet.subnet.id
}

output "public_ip_id" {
  description = "ID of the public IP"
  value       = azurerm_public_ip.pip.id
}

output "public_ip_address" {
  description = "Public IP address"
  value       = azurerm_public_ip.pip.ip_address
}

output "fqdn" {
  description = "FQDN of the public IP"
  value       = azurerm_public_ip.pip.fqdn
}

output "nsg_id" {
  description = "ID of the network security group"
  value       = azurerm_network_security_group.nsg.id
}
