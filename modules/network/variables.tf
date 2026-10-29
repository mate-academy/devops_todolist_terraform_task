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

variable "domain_name_label" {
  description = "The domain name label for the public IP address."
  type        = string
  default     = "matetask"
}