output "vnet" {
  value = azurerm_virtual_network.vnet
}

output "subnet" {
  value = azurerm_subnet.subnet
}

output "nsg" {
  value = azurerm_network_security_group.defaultnsg
}

output "public_ip" {
  value = azurerm_public_ip.linuxboxpip
}
