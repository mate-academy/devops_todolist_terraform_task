output "resource_group_name" {
  value = azurerm_resource_group.rg.name
}

output "public_ip_address" {
  value = module.network.public_ip_address
}

output "fully_qualified_domain_name" {
  value = module.network.fully_qualified_domain_name
}

output "vm_name" {
  value = module.compute.vm_name
}

output "storage_account_name" {
  value = module.storage.storage_account_name
}

output "connection_string" {
  value = "ssh -i ~/.ssh/id_rsa azureuser@${module.network.public_ip_address}"
}

output "application_url" {
  value = "http://${module.network.public_ip_address}"
}