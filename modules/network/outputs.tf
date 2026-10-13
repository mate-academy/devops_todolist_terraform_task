output "subnet_id" {
  value = azurerm_subnet.this.id
}

output "public_ip_id" {
  value = azurerm_public_ip.this.id
}

output "network_security_group_id" {
  value = azurerm_network_security_group.this.id
}

output "public_ip_address" {
  value = azurerm_public_ip.this.ip_address
}

output "public_fqdn" {
  value = azurerm_public_ip.this.fqdn
}
