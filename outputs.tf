output "resource_group_name" {
  description = "Name of the resource group"
  value       = azurerm_resource_group.main.name
}

output "vm_name" {
  description = "Name of the virtual machine"
  value       = module.compute.vm_name
}

output "vm_public_ip_fqdn" {
  description = "Public DNS name to access the app"
  value       = module.network.public_ip_fqdn
}

output "vm_private_ip" {
  description = "Private IP address of the VM"
  value       = module.compute.vm_private_ip
}

output "storage_account_name" {
  description = "Name of the storage account"
  value       = module.storage.storage_account_name
}

output "storage_container_name" {
  description = "Name of the storage container"
  value       = module.storage.storage_container_name
}

output "app_url" {
  description = "URL to access the deployed app"
  value       = "http://${module.network.public_ip_fqdn}:8080"
}