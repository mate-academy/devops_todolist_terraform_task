output "resource_group_name" {
  description = "Name of the created resource group."
  value       = azurerm_resource_group.main.name
}

output "public_ip_address" {
  description = "Public IP address of the virtual machine."
  value       = module.compute.public_ip_address
}

output "public_ip_fqdn" {
  description = "FQDN of the public IP address."
  value       = module.network.public_ip_fqdn
}

output "vm_id" {
  description = "ID of the Linux virtual machine."
  value       = module.compute.vm_id
}

output "storage_account_name" {
  description = "Name of the storage account."
  value       = module.storage.storage_account_name
}

output "storage_container_name" {
  description = "Name of the storage container."
  value       = module.storage.storage_container_name
}
