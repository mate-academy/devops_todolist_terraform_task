# No provider definition here, just outputs
output "vm_public_ip" {
  description = "Public IP address of the VM"
  value       = module.compute.vm_public_ip
}

output "storage_account_name" {
  description = "The name of the storage account"
  value       = module.storage.storage_account_name
}

output "storage_container_name" {
  description = "The name of the storage container"
  value       = module.storage.storage_container_name
}
