variable "location" {
  type    = string
  default = "uksouth"
}

variable "resource_group_name" {
  type    = string
  default = "mate-azure-task-12"
}

# Network
variable "vnet_name" {
  type    = string
  default = "vnet"
}

variable "vnet_address_space" {
  type    = list(string)
  default = ["10.0.0.0/16"]
}

variable "subnet_name" {
  type    = string
  default = "default"
}

variable "subnet_address_prefix" {
  type    = string
  default = "10.0.0.0/24"
}

variable "nsg_name" {
  type    = string
  default = "defaultnsg"
}

variable "public_ip_name" {
  type    = string
  default = "linuxboxpip"
}

variable "dns_label_prefix" {
  type    = string
  default = "matetask"
}

variable "vm_name" {
  type    = string
  default = "matebox"
}

variable "vm_size" {
  type    = string
  default = "Standard_B1s"
}

variable "admin_username" {
  type    = string
  default = "azureuser"
}

variable "ssh_public_key" {
  type    = string
  default = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCUcamkRnhPf0srck1aYheASN9l4zdgObg7GiEdBDjr+1/kUt+Q4BClcoQ54IiMP65wf83quhPW8BXJmQMUovHYgZNs6B+dxHRpR1uiRdhHwC8I8LhtBjXu4f27zvGuRxfbaud9L2s3+LiBkxRIp9KQgJdoVI9B6fghzh1EpdL50htOY2hrpN4gObOtvyyVzGEaQYQoakTR1MqYsJja9G0sfOjXCBCGTeS00ioIPr/8+YFWc2C72+4BRQ5z2jmD6XqDiRrJZOjSrxG0P0+3RsovyAvHdd6X310f9Y8NL0h5n1HqYPJ3B7nXbu+mqvRcOXPF76Ma5WCLri1J1R/p"
}

# Storage 
variable "storage_account_name" {
  type    = string
  default = "task1234567890"
}

variable "storage_container_name" {
  type    = string
  default = "task-artifacts"
}

# GitHub raw URL
variable "github_owner" {
  type    = string
  default = "KyryloKilin"
}

variable "github_repo" {
  type    = string
  default = "devops_todolist_terraform_task"
}

variable "github_ref" {
  type    = string
  default = "main"
}
