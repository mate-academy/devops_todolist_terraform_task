output "nsg_id" {
  value = azurerm_network_security_group.net_security_group.id
}

output "subnet_id" {
  value = azurerm_subnet.subnet.id
}

output "public_ip" {
  value = azurerm_public_ip.public_ip.id
}
