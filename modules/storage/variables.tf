variable "resource_group_name" {
  description = "Name of the resource group for the storage resources"
  type        = string
}

variable "location" {
  description = "Azure region (e.g. westeurope)"
  type        = string
}

variable "storage_account_name" {
  description = "Base name of the storage account (a random suffix is appended for global uniqueness)"
  type        = string
}
