output "public_ip_address" {
  description = "The public IP address of the deployed virtual machine"
  value       = module.network.public_ip_address
}

output "public_ip_fqdn" {
  description = "The FQDN of the public IP address"
  value       = module.network.public_ip_fqdn
}

output "virtual_machine_id" {
  description = "The ID of the created virtual machine"
  value       = module.compute.virtual_machine_id
}

output "virtual_machine_name" {
  description = "The name of the created virtual machine"
  value       = module.compute.vm_name
}

output "private_ip_address" {
  description = "The private IP address of the virtual machine"
  value       = module.compute.network_interface_private_ip
}

output "resource_group_name" {
  description = "The name of the resource group"
  value       = module.network.resource_group_name
}

output "storage_account_name" {
  description = "The name of the storage account"
  value       = module.storage.storage_account_name
}

output "primary_blob_endpoint" {
  description = "The primary blob endpoint of the storage account"
  value       = module.storage.primary_blob_endpoint
}

output "access_instructions" {
  description = "Instructions for accessing the deployed application"
  value       = "Access the application at http://${module.network.public_ip_address}:8080/ or https://${module.network.public_ip_fqdn}:8080/"
}

output "ssh_connection_string" {
  description = "SSH connection string"
  value       = "ssh azureuser@${module.network.public_ip_address}"
}

output "dns_suffix_used" {
  description = "DNS suffix used for the public IP"
  value       = module.network.dns_suffix
}
