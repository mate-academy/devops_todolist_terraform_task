output "storage_account_id" {
  value = azurerm_storage_account.example.id
}

output "storage_account_name" {
  value = azurerm_storage_account.example.name
}

output "storage_container_id" {
  value = azurerm_storage_container.task_artifacts.id
}

output "storage_container_name" {
  value = azurerm_storage_container.task_artifacts.name
}