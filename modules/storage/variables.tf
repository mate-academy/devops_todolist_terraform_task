variable "location" {
  type = string
}

variable "resource_group_name" {
  type = string
}

variable "storage_account_name_prefix" {
  type = string

  validation {
    condition     = can(regex("^[a-z0-9]{3,16}$", var.storage_account_name_prefix))
    error_message = "storage_account_name_prefix must contain 3-16 lowercase letters or numbers."
  }
}

variable "storage_container_name" {
  type = string
}
