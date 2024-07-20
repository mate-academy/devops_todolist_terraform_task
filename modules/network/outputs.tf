output "vnet_id" {
  value = azurerm_virtual_network.vnet.id
}

output "subnet_id" {
  value = azurerm_subnet.default.id
}

output "public_ip_address_id" {
  value = azurerm_public_ip.linuxboxpip.id
}

output "network_security_group_id" {
  value = azurerm_network_security_group.defaultnsg.id
}
