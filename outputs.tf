output "network_vnet_id" {
  value = module.network.virtual_network_id
}

output "network_subnet_id" {
  value = module.network.subnet_id
}

output "network_public_ip_address_id" {
  value = module.network.public_ip_address_id
}

output "network_security_group_id" {
  value = module.network.network_security_group_id
}

output "storage_account_name" {
  value = module.storage.storage_account_name
}

output "storage_container_name" {
  value = module.storage.storage_container_name
}
