output "virtual_network_id" {
  value = module.network.virtual_network_id
}

output "subnet_id" {
  value = module.network.subnet_id
}

output "network_security_group_id" {
  value = module.network.network_security_group_id
}

output "public_ip_address" {
  value = module.network.public_ip_address
}

output "vm_id" {
  value = module.compute.vm_id
}

output "vm_ip" {
  value = module.compute.vm_ip
}

output "storage_account_name" {
  value = module.storage.storage_account_name
}

output "storage_container_name" {
  value = module.storage.storage_container_name
}
