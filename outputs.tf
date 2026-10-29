output "resource_group_name" {
  value = azurerm_resource_group.this.name
}

output "public_ip_address" {
  value = module.network.public_ip_address
}

output "public_ip_fqdn" {
  value = module.network.public_ip_fqdn
}

output "vm_name" {
  value = module.compute.vm_name
}

output "storage_account_name" {
  value = module.storage.storage_account_name
}

output "storage_container_name" {
  value = module.storage.container_name
}

output "todo_app_url" {
  value = "http://${module.network.public_ip_address}:8080"
}
