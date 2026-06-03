output "storage_account_id" {
  value = azurerm_storage_account.sa.id
}

output "container_ids" {
  value = [for map in values(azurerm_storage_container.sac) : map.id]
}
