variable "storage_account_name" {
  type        = string
  description = "Name of the storage account"
  default     = "matestorageacc2026"
}

variable "storage_container_name" {
  type        = string
  description = "Name of the storage container"
  default     = "task-artifacts"
}

variable "resource_group_name" {
  type        = string
  description = "Name of the resource group"
}

variable "location" {
  type        = string
  description = "Azure region for the resources"
}