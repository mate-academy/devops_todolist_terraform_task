output "subnet_id" {
  value = azurerm_subnet.main.id
}

output "public_ip_address" {
  value = azurerm_public_ip.main.ip_address
}

output "public_ip_address_id" {
  value = azurerm_public_ip.main.id
}

output "network_security_group_id" {
  value = azurerm_network_security_group.main.id
}

output "public_ip_fqdn" {
  value = azurerm_public_ip.main.fqdn
}