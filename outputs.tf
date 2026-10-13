output "resource_group_name" {
  description = "Created Azure resource group."
  value       = azurerm_resource_group.main.name
}

output "public_ip_address" {
  description = "Allocated public IPv4 address."
  value       = module.network.public_ip_address
}

output "public_fqdn" {
  description = "Public DNS hostname for the VM."
  value       = module.network.public_fqdn
}

output "vm_id" {
  description = "ID of the deployed Linux VM."
  value       = module.compute.vm_id
}

output "storage_account_name" {
  description = "Storage account created by the storage module."
  value       = module.storage.storage_account_name
}
