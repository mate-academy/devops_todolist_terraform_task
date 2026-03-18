output "subnet_id" {
  value = azurerm_subnet.default.id
}

output "public_ip_address_id" {
  value = azurerm_public_ip.linux_box_pip.id
}

output "network_security_group_id" {
  value = azurerm_network_security_group.default_nsg.id
}
