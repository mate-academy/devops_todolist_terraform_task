output "resource_group_name" {
  value = azurerm_resource_group.main.name
}

output "public_ip_address" {
  value = module.network.public_ip_address
}

output "public_fqdn" {
  value = module.network.public_fqdn
}

output "vm_name" {
  value = module.compute.vm_name
}

output "storage_account_name" {
  value = module.storage.storage_account_name
}
