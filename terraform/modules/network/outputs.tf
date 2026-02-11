# Virtual Network
output "vnet_id" {
  description = "ID of the Virtual Network"
  value       = azurerm_virtual_network.vnet.id
}

# Subnet
output "subnet_id" {
  description = "ID of the Subnet"
  value       = azurerm_subnet.subnet.id
}

# Network Security Group
output "nsg_id" {
  description = "ID of the Network Security Group"
  value       = azurerm_network_security_group.nsg.id
}

# Public IP
output "public_ip_id" {
  description = "ID of the Public IP"
  value       = azurerm_public_ip.public_ip.id
}

# Public IP address and FQDN
output "public_ip_address" {
  description = "Public IP address"
  value       = azurerm_public_ip.public_ip.ip_address
}

output "public_ip_fqdn" {
  description = "FQDN of the Public IP"
  value       = azurerm_public_ip.public_ip.fqdn
}
