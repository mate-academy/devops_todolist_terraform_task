output "pip_dns_label" {
  value = module.network.pip_dns_label
}

output "full_pip_dns_name" {
  value = module.network.pip_dns_name
}

output "admin_username" {
  value = var.admin_username
}

output "pip_ip" {
  value = module.network.pip_ip
}

output "storage_account_id" {
  value = module.storage_account.storage_account_id
}

output "container_ids" {
  value = module.storage_account.container_ids
}
