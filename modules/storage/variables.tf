variable "storage_account_name" {
  description = "Name of the storage account (must be globally unique, lowercase, 3-24 chars)"
  type        = string
}

variable "storage_container_name" {
  description = "Name of the blob container within the storage account"
  type        = string
}

variable "resource_group_name" {
  description = "Name of the resource group where the storage account will be created"
  type        = string
}

variable "location" {
  description = "Azure region where the storage account will be deployed"
  type        = string
}