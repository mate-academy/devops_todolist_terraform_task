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

variable "subnet_id" {
  type    = string
  default = "subnetlinuxboxpip"
}

variable "public_ip_address_id" {
  type    = string
  default = "linuxboxpip"
}

variable "dns_label" {
  type    = string
  default = "dnslabel"
}

variable "vm_name" {
  type    = string
  default = "matebox"
}

variable "vm_size" {
  type    = string
  default = "Standard_B1s"
}

variable "ssh_key_private" {
  type    = string
  default = "C:/Users/Serveladus/.ssh/id_rsa"
  sensitive = true
}

variable "ssh_key_public" {
  type    = string
  default = "C:/Users/Serveladus/.ssh/id_rsa.pub"
  sensitive = true
}

variable "storage_account_name" {
  type    = string
  default = "storagemodulesouth"
}

variable "storage_container_name" {
  type    = string
  default = "task-artifacts"
}

variable "source_file_path" {
  type    = string
  default = "home/azureuser/devops_todolist_terraform_task/install-app.sh"
}

variable "admin_password" {
  type    = string
  default = "root"
}
