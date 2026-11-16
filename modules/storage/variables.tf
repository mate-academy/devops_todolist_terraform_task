variable "resource_group_name" {
  type = string
}

variable "location" {
  type = string
}

variable "storage_account_name" {
  type = string
}

variable "storage_container_name" {
  type = string
}
variable "storage_account_key" {
  description = "Storage account access key"
  type        = string
}