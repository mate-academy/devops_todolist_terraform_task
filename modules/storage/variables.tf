variable "location" {
  description = "The location where resources will be created"
  type        = string
  default     = "uksouth"

}

variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
  default     = "mate-azure-task-12"

}

variable "storage_account_name" {
  description = "The name of the storage account"
  type        = string
  default     = "electicwizard2345542356"

}

variable "container_name" {
  description = "The name of the storage container"
  type        = string
  default     = "task-artifacts"

}