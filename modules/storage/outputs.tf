output "storage_account_name" {
  value = azurerm_storage_account.example.name
}

output "storage_container_name" {
  value = azurerm_storage_container.example.name
}

output "storage_account_id" {
  value = azurerm_storage_account.example.id
}

output "primary_access_key" {
  value = azurerm_storage_account.example.primary_access_key
}

output "container_name" {
  value = azurerm_storage_container.example.name
}

output "script_blob_url" {
  value = azurerm_storage_blob.script.url
}

