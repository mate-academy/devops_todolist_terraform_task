output "rg_id" {
  value = azurerm_resource_group.main.id
}

output "rg_name" {
  value = azurerm_resource_group.main.name
}

output "vnet_id" {
  value = module.network.vnet_id
}

output "subnet_id" {
  value = module.network.subnet_id
}

output "public_ip_id" {
  value = module.network.public_ip_id
}

output "nsg_id" {
  value = module.network.nsg_id
}

output "network_interface_id" {
  value = module.compute.network_interface_id
}

output "vm_id" {
  value = module.compute.vm_id
}

output "vm_extension_id" {
  value = module.compute.vm_extension_id
}

output "sa_id" {
  value = module.storage.sa_id
}

output "sa_name" {
  value = module.storage.sa_name
}

output "storage_container_id" {
  value = module.storage.storage_container_id
}