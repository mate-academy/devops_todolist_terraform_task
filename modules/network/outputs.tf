output "public_ip_address_id" {
  description = "The public IP address"
  value       = azurerm_public_ip.linuxboxpip.id
}

output "public_ip_dns" {
  description = "The public IP DNS Name"
  value       = azurerm_public_ip.linuxboxpip.fqdn
}

output "vnet_address" {
  description = "The address virtual network"
  value       = join(", ", azurerm_virtual_network.vnet.address_space)
}

output "vnet_name" {
  description = "The name of the virtual network"
  value       = azurerm_virtual_network.vnet.name
}

output "subnet_id" {
  description = "The name of the subnet"
  value       = azurerm_subnet.subnet.id
}
