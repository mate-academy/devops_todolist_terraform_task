output "subnet_id" {
  value = azurerm_subnet.internal.id
}

output "public_ip_id" {
  value = azurerm_public_ip.example.id
}

output "nsg_id" {
  value = azurerm_network_security_group.example.id
}