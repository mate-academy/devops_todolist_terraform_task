variable "location" {
  type    = string
  default = "uksouth"
}

variable "resource_group_name" {
  type    = string
  default = "mate-azure-task-12"
}

variable "vm_name" {
  type    = string
  default = "matebox"
}

variable "vm_size" {
  type    = string
  default = "Standard_B1s"
}

variable "subnet_id" {
  type = string
}

variable "public_ip_id" {
  type = string
}

variable "ssh_key_public" {
  type      = string
  sensitive = true
}
variable "repo_url" {
  type    = string
  default = "https://github.com/ll221/devops_todolist_terraform_task.git"
}