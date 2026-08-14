output "virtual_network_id" {
  description = "ID of the virtual network"
  value       = azurerm_virtual_network.vnet.id
}

output "subnet_id" {
  description = "ID of the default subnet"
  value       = azurerm_subnet.default.id
}

output "network_security_group_id" {
  description = "ID of the default network security group"
  value       = azurerm_network_security_group.defaultnsg.id
}

output "public_ip_id" {
  description = "ID of the public IP"
  value       = azurerm_public_ip.linuxboxpip.id
}

output "public_ip_address" {
  description = "Public IP address"
  value       = azurerm_public_ip.linuxboxpip.ip_address
}

output "public_ip_dns_name" {
  description = "DNS name of the public IP"
  value       = azurerm_public_ip.linuxboxpip.fqdn
}