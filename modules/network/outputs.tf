output "vnet_name" {
  value = azurerm_virtual_network.main.name
}

output "subnet_id" {
  value = azurerm_subnet.main.id
}

output "nsg_id" {
  value = azurerm_network_security_group.main.id
}

output "public_ip_id" {
  value = azurerm_public_ip.main.id
}

output "full_domain_name" {
  value = azurerm_public_ip.main.fqdn
}
