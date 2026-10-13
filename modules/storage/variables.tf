variable "resource_group_name" {
  description = "Resource Group Name"
  type        = string
}

variable "location" {
  description = "Azure Region"
  type        = string
}

variable "storage_account" {
  description = "Storage account name"
  type        = string
  default     = "fedtaskportfolio"
}

variable "storage_container" {
  description = "Storage container name"
  type        = string
  default     = "task-artifacts"
}