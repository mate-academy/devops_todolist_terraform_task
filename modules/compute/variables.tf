variable "vm_name" {
  default = "matebox"
}

variable "image" {
  default = "Ubuntu2204"
}

variable "size" {
  default = "Standard_B1s"
}

variable "ssh_key" {
  default = "linuxboxsshkey"
}

variable "location" {
  default = "uksouth"
}

variable "resource_group_name" {
  default = "mate-azure-task-12"
}

variable "subnet_id" {
  description = "The ID of the subnet where the NIC will be placed"
  type        = string
}

variable "public_ip_id" {
  description = "The ID of the public IP address"
  type        = string
}