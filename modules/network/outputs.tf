output "vnet_id" {
  value = azurerm_virtual_network.vnet.id
}

output "pip_dns_label" {
  value = azurerm_public_ip.pip.domain_name_label
}

output "pip_dns_name" {
  value = azurerm_public_ip.pip.fqdn
}

output "subnet_id" {
  value = azurerm_subnet.default.id
}

output "pip_ip" {
  value = azurerm_public_ip.pip.ip_address
}

output "pip_id" {
  value = azurerm_public_ip.pip.id
}


output "network_security_group_id" {
  value = azurerm_network_security_group.nsg.id
}