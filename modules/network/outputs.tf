output "vnet_id" {
  description = "The ID of the Virtual Network."
  value       = azurerm_virtual_network.vnet.id
}

output "vnet_name" {
  description = "The name of the Virtual Network."
  value       = azurerm_virtual_network.vnet.name
}

output "subnet_id" {
  description = "The ID of the Subnet."
  value       = azurerm_subnet.subnet.id
}

output "subnet_name" {
  description = "The name of the Subnet."
  value       = azurerm_subnet.subnet.name
}

output "nsg_id" {
  description = "The ID of the Network Security Group."
  value       = azurerm_network_security_group.defaultnsg.id
}

output "nsg_name" {
  description = "The name of the Network Security Group."
  value       = azurerm_network_security_group.defaultnsg.name
}

output "public_ip_id" {
  description = "The ID of the Public IP address."
  value       = azurerm_public_ip.linuxboxpip.id
}

output "public_ip_address" {
  description = "The allocated Public IP address."
  value       = azurerm_public_ip.linuxboxpip.ip_address
}

output "public_ip_domain_name" {
  description = "The FQDN (fully qualified domain name) of the Public IP address."
  value       = azurerm_public_ip.linuxboxpip.fqdn
}

output "dns_label_with_suffix" {
  description = "The domain name label with a random suffix."
  value       = azurerm_public_ip.linuxboxpip.domain_name_label
}
