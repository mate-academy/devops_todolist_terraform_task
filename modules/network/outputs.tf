output "vnet_id" {
  description = "The ID of the virtual network."
  value       = azurerm_virtual_network.vnet.id
}

output "network_security_group_id" {
  description = "The ID of the network security group."
  value       = azurerm_network_security_group.defaultnsg.id
}

output "public_ip_id" {
  description = "The ID of the public IP address."
  value       = azurerm_public_ip.linuxboxpip.id
}

output "public_ip_address" {
  description = "The public IP address value."
  value       = azurerm_public_ip.linuxboxpip.ip_address
}

output "public_ip_fqdn" {
  description = "The fully qualified domain name (FQDN) of the public IP address."
  value       = azurerm_public_ip.linuxboxpip.fqdn
}

output "subnet_id" {
  description = "The ID of the subnet."
  value = azurerm_subnet.default.id
}

