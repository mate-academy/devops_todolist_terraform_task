output "vnet_id" {
  value = azurerm_virtual_network.vnet.id
}

output "subnet_id" {
  value = azurerm_subnet.default.id
}

output "nsg_id" {
  value = azurerm_network_security_group.defaultnsg.id
}

output "public_ip_address" {
  value = azurerm_public_ip.linuxboxpip.ip_address
}

output "public_ip_dns" {
  value = azurerm_public_ip.linuxboxpip.fqdn
}
