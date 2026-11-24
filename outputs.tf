output "public_ip_address" {
  description = "Public IP address of the VM"
  value       = module.network.public_ip_address
}

output "fqdn" {
  description = "FQDN of the public IP"
  value       = module.network.fqdn
}

output "storage_account_name" {
  description = "Name of the storage account"
  value       = module.storage.storage_account_name
}

output "vm_id" {
  description = "ID of the virtual machine"
  value       = module.compute.vm_id
}
