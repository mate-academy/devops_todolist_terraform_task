output "subnet_id" {
  value = azurerm_subnet.subnet.id
}

output "public_ip_address" {
  value = azurerm_public_ip.linuxboxpip.ip_address
}

output "public_ip_address_id" {
  value = azurerm_public_ip.linuxboxpip.id
}

output "virtual_network" {
  value = azurerm_virtual_network.vnet
}
