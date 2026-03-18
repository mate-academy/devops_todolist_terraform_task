output "network_security_group_id" {
  value = module.network.network_security_group_id
}

output "public_ip_address_id" {
  value = module.network.public_ip_address_id
}

output "subnet_id" {
  value = module.network.subnet_id
}

output "vm_id" {
  value = module.compute.vm_id
}

output "storage_container_id" {
  value = module.storage.storage_container_id
}
