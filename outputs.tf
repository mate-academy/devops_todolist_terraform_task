output "storage_blob_id" {
  description = "ID of the uploaded blob"
  value       = azurerm_storage_blob.example.id
}

output "storage_blob_name" {
  description = "Name of the uploaded blob"
  value       = azurerm_storage_blob.example.name
}

output "storage_blob_url" {
  description = "URL to access the uploaded blob"
  value       = azurerm_storage_blob.example.url
}