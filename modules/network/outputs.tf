output "virtual_network_id" {
  description = "Virtual network ID"
  value       = azurerm_virtual_network.main.id
}

output "subnet_id" {
  description = "Subnet ID"
  value       = azurerm_subnet.main.id
}

output "network_security_group_id" {
  description = "Network security group ID"
  value       = azurerm_network_security_group.main.id
}

output "public_ip_address" {
  description = "Public IP address"
  value       = azurerm_public_ip.main.ip_address
}

output "public_ip_id" {
  description = "Public IP address ID"
  value       = azurerm_public_ip.main.id
}

output "public_ip_fqdn" {
  description = "Public IP FQDN"
  value       = azurerm_public_ip.main.fqdn
}

output "resource_group_name" {
  description = "Resource group name"
  value       = azurerm_resource_group.main.name
}

output "dns_suffix" {
  value = random_integer.dns_suffix.result
}
