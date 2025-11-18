variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}

variable "location" {
  description = "Azure region for resources"
  type        = string
}

variable "storage_account_name" {
  description = "Name of the storage account (3-24 chars, lowercase alphanumeric only, must be globally unique)"
  type        = string
}

variable "install_app_script_path" {
  description = "Path to the install-app.sh script file"
  type        = string
}
