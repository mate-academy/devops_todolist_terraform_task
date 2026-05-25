# The subnet ID.
output "subnet_id" {
  description = "The ID of the subnet."
  value       = azurerm_subnet.subnet.id
}

# The Public IP Address ID. Required for NIC association.
output "public_ip_id" {
  description = "The ID of the Public IP Address."
  value       = azurerm_public_ip.pip.id
}

# The Network Security Group ID. Required for NIC association.
output "nsg_id" {
  description = "The ID of the Network Security Group."
  value       = azurerm_network_security_group.nsg.id
}

# The Public IP address of the Linux VM.
output "public_ip_address" {
  description = "The Public IP Address of the Linux VM."
  value       = azurerm_public_ip.pip.ip_address
}

# The FQDN of the Public IP Address.
output "public_ip_fqdn" {
  description = "The FQDN of the Public IP Address."
  value       = azurerm_public_ip.pip.fqdn
}
