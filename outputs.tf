output "vm_public_dns" {
  value = module.network.public_ip_fqdn
}

output "vm_name" {
  value = module.compute.vm_name
}

output "storage_account" {
  value = module.storage.storage_account_name
}