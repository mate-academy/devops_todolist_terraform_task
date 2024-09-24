output "storage_account" {
  value = azurerm_storage_account.main
}

output "task_artifacts_storage_container" {
  value = azurerm_storage_container.task_artifacts
}

output "storage_blob" {
  value = azurerm_storage_blob.script-blob
}
