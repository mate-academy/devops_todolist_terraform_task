variable "resource_group_name" {
  type = string
}

variable "location" {
  type = string
}

variable "storage_account_prefix" {
  type    = string
  default = "sttodoapp"
}

variable "container_name" {
  type    = string
  default = "task-artifacts"
}
