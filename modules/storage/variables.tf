variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

variable "location" {
  description = "The location for storage resources"
  type        = string
}

variable "storage_account_name" {
  description = "The name of the storage account"
  type        = string
  default     = "matetaskstorageacc12"
}

variable "container_name" {
  description = "The name of the storage container"
  type        = string
  default     = "task-artifacts"
}