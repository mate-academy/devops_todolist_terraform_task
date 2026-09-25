variable "storage_account_name" {
  description = "The name of the storage account."
  type        = string
  default     = "mateazuretask12storage"
}

variable "location" {
  description = "The location where the resources will be created."
  type        = string
  default     = "eastus"
}

variable "resource_group_name" {
  description = "The name of the resource group where the resources will be created."
  type        = string
  default     = "resource-group"
}