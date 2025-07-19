# Network module outputs #
output "network_subnet_id" {
  description = "The subnet ID created by the network module"
  value       = module.network.subnet_id
}

output "network_public_ip_address" {
  description = "The public IP address assigned by the network module"
  value       = module.network.public_ip
}

# Compute module outputs  #
output "vm_id" {
  description = "The ID of the Linux VM"
  value       = module.compute.vm_id
}


# Storage module outputs   #
output "storage_account_name" {
  description = "The name of the storage account"
  value       = module.storage.storage_account_name
}

output "storage_container_name" {
  description = "The name of the storage container"
  value       = module.storage.storage_container_name
}
