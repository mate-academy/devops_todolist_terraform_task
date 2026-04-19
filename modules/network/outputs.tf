output "subnet_id" {
  value = azurerm_subnet.default.id
}
output "nsg_id" {
  value = azurerm_network_security_group.defaultnsg.id
}
output "public_ip_id" {
  value = azurerm_public_ip.example.id
}
output "public_ip_fqdn" {
  value = azurerm_public_ip.example.fqdn
}