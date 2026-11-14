output "public_ip_address" {
  description = "Public IP address of the virtual machine."
  value       = module.network.public_ip_address
}

output "public_ip_fqdn" {
  description = "DNS name of the virtual machine."
  value       = module.network.public_ip_fqdn
}

output "vm_name" {
  value = module.compute.vm_name
}

output "storage_account_name" {
  value = module.storage.storage_account_name
}
