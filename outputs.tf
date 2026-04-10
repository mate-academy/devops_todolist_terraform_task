output "resource_group_name" {
  value = azurerm_resource_group.main.name
}

output "public_ip_fqdn" {
  value = module.network.public_ip_fqdn
}

output "storage_account_name" {
  value = module.storage.storage_account_name
}
