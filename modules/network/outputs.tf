output "virtual_network_id" {
  value = azurerm_virtual_network.main.id
}

output "virtual_network_security_id" {
  value = azurerm_network_security_group.main.id
}

output "public_address_ip_id" {
  value = azurerm_public_ip.main.id
}

output "subnet_id" {
  value = azurerm_subnet.main.id
}