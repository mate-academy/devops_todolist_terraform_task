output "resource_group_name" {
  value = azurerm_resource_group.main.name
}

output "storage_account_name" {
  value = module.storage.storage_account_name
}

output "storage_container_name" {
  value = module.storage.storage_container_name
}

output "blob_url" {
  value = module.storage.blob_url
}

output "virtual_network_name" {
  value = module.network.virtual_network.name
}

output "subnet_id" {
  value = module.network.subnet_id
}

output "public_ip_address" {
  value = module.network.public_ip_address
}

output "vm_id" {
  value = module.compute.vm_id
}
