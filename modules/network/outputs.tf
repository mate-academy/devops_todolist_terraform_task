output "public_ip" {
  value = azurerm_public_ip.public_ip.ip_address
}

output "public_ip_address_id" {
  value = azurerm_public_ip.public_ip.id
}

output "subnet_id" {
  value = azurerm_subnet.main.id
}
