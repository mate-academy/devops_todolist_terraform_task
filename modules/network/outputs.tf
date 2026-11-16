output "subnet_id" {
  value = azurerm_subnet.example.id
}
output "public_ip_id" {
  value = azurerm_public_ip.example.id
}
output "public_ip_address" {
  value = azurerm_public_ip.example.ip_address
}

output "network_security_group_id" {
  value = azurerm_network_security_group.example.id
}



