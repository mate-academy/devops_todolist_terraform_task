output "virtual_network_id" {
  description = "The ID of the Virtual Network"
  value       = azurerm_virtual_network.main.id
}

output "subnet_id" {
  description = "The ID of the Subnet"
  value       = azurerm_subnet.internal.id
}

output "network_security_group_id" {
  description = "The ID of the Network Security Group"
  value       = azurerm_network_security_group.nsg.id
}

output "public_ip_address_id" {
  description = "The public IP address"
  value       = azurerm_public_ip.main.id
}

output "public_ip_dns" {
  description = "The DNS name associated with the Public IP"
  value       = azurerm_public_ip.main.fqdn
}

