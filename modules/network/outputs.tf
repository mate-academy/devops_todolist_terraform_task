output "virtual_network_id" {
  description = "ID of the virtual network"
  value       = azurerm_virtual_network.vnet.id
}

output "virtual_network_name" {
  description = "Name of the virtual network"
  value       = azurerm_virtual_network.vnet.name
}

output "subnet_name" {
  description = "Name of the subnet"
  value       = azurerm_subnet.default.name
}

output "network_security_group_id" {
  description = "ID of the network security group"
  value       = azurerm_network_security_group.nsg.id
}

output "network_security_group_name" {
  description = "Name of the network security group"
  value       = azurerm_network_security_group.nsg.name
}

output "subnet_id" {
  description = "ID of the subnet"
  value       = azurerm_subnet.default.id
}

output "public_ip_id" {
  description = "ID of the public IP"
  value       = azurerm_public_ip.linuxboxpip.id
}

output "public_ip" {
  description = "Public IP address"
  value       = azurerm_public_ip.linuxboxpip.ip_address
}