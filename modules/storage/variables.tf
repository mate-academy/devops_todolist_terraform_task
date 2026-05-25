variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}
variable "location" {
  description = "Azure region for resources"
  type        = string
}
variable "storage_account_name" {
  description = "Name of the storage account for application artifacts"
  type        = string
}
variable "storage_container_name" {
  description = "Name of the storage container for application artifacts"
  type        = string
}