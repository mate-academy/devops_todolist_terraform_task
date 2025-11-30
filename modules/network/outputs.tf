output "subnet_id" {
  description = "The ID of the Subnet required by the compute module."
  value       = azurerm_subnet.subnet.id
}

output "public_ip_id" {
  description = "The ID of the Public IP address."
  value       = azurerm_public_ip.pip.id
}

output "public_ip_address" {
  description = "The actual Public IP address assigned."
  value       = azurerm_public_ip.pip.ip_address
}

output "public_ip_fqdn" {
  description = "The fully qualified domain name (FQDN)."
  value       = azurerm_public_ip.pip.fqdn
}

output "nsg_id" {
  description = "The ID of the Network Security Group."
  value       = azurerm_network_security_group.nsg.id
}