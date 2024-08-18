output "net_vnet" {
  value = azurerm_virtual_network.main
}

output "net_subnet" {
  value = azurerm_subnet.main
}

output "net_nsg" {
  value = azurerm_network_security_group.main
}

output "net_pubip" {
  value = azurerm_public_ip.main
}
