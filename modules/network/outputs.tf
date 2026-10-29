output "vnet_id" {
  description = "ID of the virtual network."
  value       = azurerm_virtual_network.vnet.id
}

output "subnet_id" {
  description = "ID of the subnet."
  value       = azurerm_subnet.default.id
}

output "nsg_id" {
  description = "ID of the network security group."
  value       = azurerm_network_security_group.defaultnsg.id
}

output "public_ip_id" {
  description = "ID of the public IP address."
  value       = azurerm_public_ip.linuxboxpip.id
}

output "public_ip_address" {
  description = "Public IP address value."
  value       = azurerm_public_ip.linuxboxpip.ip_address
}

output "public_ip_fqdn" {
  description = "FQDN assigned to the public IP."
  value       = azurerm_public_ip.linuxboxpip.fqdn
}
