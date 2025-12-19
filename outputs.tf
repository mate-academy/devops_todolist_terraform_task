output "resource_group_name" {
  value = azurerm_resource_group.this.name
}

output "public_ip_fqdn" {
  value = module.network.public_ip_fqdn
}

output "public_ip_dns_label" {
  value = module.network.public_ip_dns_label
}
