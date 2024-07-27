output "storage_account_name" {
  value = azurerm_storage_account.storage.name
}

output "storage_container_name" {
  value = azurerm_storage_container.container.name
}

output "blob_url" {
  value = azurerm_storage_blob.todoapp_blob.url
}
