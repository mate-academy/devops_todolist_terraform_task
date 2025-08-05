variable "storage_account_name" {
  description = "The name of the storage account to create."
  type        = string
  default     = "limbxtodoliststorage"
}

variable "location" {
  description = "The Azure region where the storage account will be created."
  type        = string
  default     = "East US"
}

variable "resource_group_name" {
  description = "The name of the resource group where the storage account will be created."
  type        = string
  default     = "mate-azure-task-12"
}

variable "container_name" {
  description = "The name of the storage container to create."
  type        = string
  default     = "task-artifacts"
}