variable "location" {
  description = "The location where all resources will be deployed."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group that will contain all the resources."
  type        = string
}

variable "storage_account_name" {
  type = string
}

variable "container_name" {
  type = string
}
