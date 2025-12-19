output "vnet_id" {
  value = azurerm_virtual_network.this.id
}

output "subnet_id" {
  value = azurerm_subnet.default.id
}

output "nsg_id" {
  value = azurerm_network_security_group.default.id
}

output "public_ip_id" {
  value = azurerm_public_ip.linuxbox.id
}

output "public_ip_fqdn" {
  value = azurerm_public_ip.linuxbox.fqdn
}

output "public_ip_dns_label" {
  value = azurerm_public_ip.linuxbox.domain_name_label
}
