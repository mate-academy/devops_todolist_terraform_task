output "subnet_id" {
  value       = azurerm_subnet.subnet.id
  description = "ID of the created subnet"
}

output "public_ip_id" {
  value       = azurerm_public_ip.pip.id
  description = "ID of the public IP address"
}

output "nsg_id" {
  value       = azurerm_network_security_group.nsg.id
  description = "ID of the network security group"
}