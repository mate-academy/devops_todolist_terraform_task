output "subnet_id" {
  value = azurerm_subnet.subnet.id
}

output "network_security_group_id" {
  value = azurerm_network_security_group.defaultnsg.id
}

output "public_ip_id" {
  value = azurerm_public_ip.public_ip.id
}

output "public_ip_address" {
  value = azurerm_public_ip.public_ip.ip_address
}
