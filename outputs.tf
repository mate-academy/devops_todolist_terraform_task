output "vnet_id" {
  value = module.network.vnet_id
}

output "subnet_id" {
  value = module.network.subnet_id
}

output "nsg_id" {
  value = module.network.nsg_id
}

output "public_ip_address" {
  value = module.network.public_ip_address
}

output "virtual_machine_id" {
  value = module.compute.virtual_machine_id
}

output "virtual_machine_name" {
  value = module.compute.virtual_machine_name
}

output "storage_account_name" {
  value = module.storage.storage_account_name
}