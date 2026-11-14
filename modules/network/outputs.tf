output "azurerm_network_security_group_name" {
  value = azurerm_network_security_group.portfolio.name
}

output "azurerm_virtual_network_name" {
  value = azurerm_virtual_network.portfolio.name
}

output "azurerm_subnet_address_space" {
  value = azurerm_subnet.portfolio.address_prefixes
}

output "public_ip_address" {
  value = azurerm_public_ip.portfolio.ip_address
}

output "subnet_id" {
  value = azurerm_subnet.portfolio.id
}

output "public_ip_id" {
  value = azurerm_public_ip.portfolio.id
}
output "public_ip_fqdn" {
  value = azurerm_public_ip.portfolio.fqdn
}
