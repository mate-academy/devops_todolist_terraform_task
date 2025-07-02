output "virtual_network_name" {
  value = azurerm_virtual_network.main.name
}

output "subnet_name" {
  value = azurerm_subnet.internal.name
}

output "network_security_group_name" {
  value = azurerm_network_security_group.example.name
}

output "public_ip_address_name" {
  value = azurerm_public_ip.example.name
}