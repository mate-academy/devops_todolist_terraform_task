output "public_ip_address" {
  value = module.network.public_ip_address
}

output "public_ip_fqdn" {
  value = module.network.public_ip_fqdn
}

output "storage_account_name" {
  value = module.storage.storage_account_name
}
