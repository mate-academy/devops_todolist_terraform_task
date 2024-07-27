output "vnet_id" {
  value = azurerm_virtual_network.vnet.id
}

output "subnet_id" {
  value = azurerm_subnet.subnet.id
}

output "nsg_id" {
  value = azurerm_network_security_group.nsg.id
}

output "pip_id" {
  value = azurerm_public_ip.pip.id
}

output "public_ip_address" {
  value = azurerm_public_ip.pip.ip_address
}

output "public_ip_id" {
  value = azurerm_public_ip.pip.id
}