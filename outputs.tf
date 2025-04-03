output "public_ip" {
  description = "The public IP address of the virtual machine"
  value       = module.network.public_ip_address_id
}

output "resource_group_name" {
  description = "The name of the resource group"
  value       = azurerm_resource_group.main.name
}

output "vm_name" {
  description = "The name of the virtual machine"
  value       = module.compute.vm_name
}

output "storage_account_id" {
  description = "The ID of the storage account"
  value       = module.storage.storage_account_id
}

output "subnet_id" {
  description = "The ID of the subnet"
  value       = module.network.subnet_id
}

output "storage_container_name" {
  description = "The name of the storage container"
  value       = module.storage.storage_container_name
}
