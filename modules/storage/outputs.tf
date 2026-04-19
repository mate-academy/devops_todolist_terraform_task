output "storage_account_name" {
  value = azurerm_storage_account.st_acc.name
}

output "storage_container_name" {
  value = azurerm_storage_container.task_artifacts.name
}