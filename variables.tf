variable "location" {
  type    = string
  default = "uksouth"
}

variable "resource_group_name" {
  type    = string
  default = "mate-azure-task-12"
}

variable "virtual_network_name" {
  type    = string
  default = "vnet"
}

variable "vnet_address_prefix" {
  type    = string
  default = "10.0.0.0/16"
}

variable "subnet_name" {
  type    = string
  default = "default"
}

variable "subnet_address_prefix" {
  type    = string
  default = "10.0.0.0/24"
}

variable "network_security_group_name" {
  type    = string
  default = "defaultnsg"
}

variable "public_ip_address_name" {
  type    = string
  default = "linuxboxpip"
}

variable "vm_name" {
  type    = string
  default = "matebox"
}

variable "vm_size" {
  type    = string
  default = "Standard_B2ts_v2"
}

variable "ssh_key_public" {
  type      = string
  sensitive = true
}

variable "dns_label" {
  type    = string
  default = "matetask"
}

variable "github_repo_url" {
  type    = string
  default = "https://github.com/spridoloba/devops_todolist_terraform_task.git"
}
