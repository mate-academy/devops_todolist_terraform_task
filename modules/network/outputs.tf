output "vnet_id" {
  description = "The ID of the virtual network."
  value       = azurerm_virtual_network.main.id # Исправлено на main
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

output "subnet_id" {
  description = "The ID of the subnet."
  value       = azurerm_subnet.subnet.id
}

output "pip_id" {
  description = "The ID of the public IP address."
  value       = azurerm_public_ip.linuxboxpip.id
}

output "nsg_id" {
  description = "The ID of the network security group."
  value       = azurerm_network_security_group.defaultnsg.id
}