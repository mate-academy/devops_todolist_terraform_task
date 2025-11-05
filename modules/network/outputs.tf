output "subnet_id" {
  value = azurerm_subnet.this.id
}

output "public_ip_id" {
  value = azurerm_public_ip.this.id
}

output "nsg_id" {
  value = azurerm_network_security_group.this.id
}