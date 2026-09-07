variable "storage_account_name" {
  default = "todoappstorage12345"
}

variable "storage_container_name" {
  default = "task-artifacts"
}

variable "resource_group_name" {
  type = string
}

variable "location" {
  type = string
}
