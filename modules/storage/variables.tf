variable "resource_group_name" {
  type    = string
  default = "mate-azure-task-12"
}

variable "location" {
  type    = string
  default = "uksouth"
}

variable "storage_account_name" {
  type        = string
  default = "task-artifacts"
}

variable "source_file_path" {
  type    = string
  default = "https://github.com/mate-academy/devops_todolist_terraform_task/raw/main/install-app.sh"
}
