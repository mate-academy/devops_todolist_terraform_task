variable "location" {
  type    = string
  default = "uksouth"
}

variable "resource_group_name" {
  type    = string
  default = "mate-azure-task-12"
}

variable "storage_account_name" {
  type = string
}

variable "storage_container_name" {
  type    = string
  default = "task-artifacts"
}