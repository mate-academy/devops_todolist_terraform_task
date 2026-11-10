output "public_ip_address" {
  value = module.network.public_ip_address
}

output "fqdn" {
  value = module.network.fqdn
}

output "storage_account_name" {
  value = module.storage.storage_account_name
}

output "vm_id" {
  value = module.compute.vm_id
}