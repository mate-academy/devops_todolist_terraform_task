variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
}

variable "storage_account_prefix" {
  description = "Prefix for the storage account name"
  type        = string
  default     = "matetasksa"
}

variable "container_name" {
  description = "Name of the storage container"
  type        = string
  default     = "task-artifacts"
}
