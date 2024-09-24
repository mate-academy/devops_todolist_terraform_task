variable "location" {
  description = "The location where all resources will be deployed."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group that will contain all the resources."
  type        = string
}

variable "storage_account_name" {
  description = "The name of the Azure Storage Account that will store the task artifacts."
  type        = string
}

variable "task_artifacts_container_name" {
  description = "The name of the container in the storage account where task artifacts will be stored."
  type        = string
}
