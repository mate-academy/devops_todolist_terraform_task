variable "location" {
  default = "uksouth"
}

variable "resource_group_name" {
  default = "mate-azure-task-12"
}

variable "virtual_network_name" {
  default = "vnet"
}

variable "vnet_address_space" {
  default = "10.0.0.0/16"
}

variable "subnet_name" {
  default = "default"
}

variable "subnet_address_prefix" {
  default = "10.0.0.0/24"
}

variable "storage_account_name" {
  default = "pyhonappstoragetf22123"
}

variable "storage_container_name" {
  default = "task-artifacts"
}

variable "network_security_group_name" {
  default = "defaultnsg"
}

variable "public_ip_name" {
  default = "linuxboxpip"
}

variable "vm_name" {
  default = "matebox"
}

variable "vm_size" {
  default = "Standard_B1s"
}

variable "ssh_key_public" {

}

variable "dns_label" {
  default = "matetask"
}