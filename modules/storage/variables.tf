variable "resource_group_name" {
  type = string
}

variable "location" {
  type = string
}

variable "azurerm_storage_account" {
  type    = string
  default = "storagekonstantinou77"
}

variable "azurerm_storage_container" {
  type    = string
  default = "task-artifacts"
}
