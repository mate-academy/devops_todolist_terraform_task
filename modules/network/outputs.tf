output "subnet_id" {
  description = "The ID of the created subnet."
  value       = azurerm_subnet.default.id
}

output "nsg_id" {
  description = "The ID of the created network security group."
  value       = azurerm_network_security_group.defaultnsg.id
}

output "public_ip_id" {
  description = "The ID of the created public IP address."
  value       = azurerm_public_ip.linuxboxpip.id
}

output "public_ip_address" {
  value = azurerm_public_ip.linuxboxpip.ip_address
}