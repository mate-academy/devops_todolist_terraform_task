variable "resource_group_name" {
  description = "The name of the resource group in which to create the resources."
  type        = string
}

variable "location" {
  description = "The Azure region in which to create the resources."
  type        = string
}

variable "storage_account_name" {
  description = "The name of the storage account to create."
  type        = string
}

variable "container_name" {
  description = "The name of the storage container to create."
  type        = string
  default     = "task-artifacts"
}
