variable "location" {
  type        = string
  description = "The location of VM"
}

variable "resource_group_name" {
  type        = string
  description = "The name of the resource group"
}

variable "vm_name" {
  type        = string
  description = "The name of the VM"
}

variable "vm_size" {
  type        = string
  description = "The size of the VM"
}

variable "ssh_key_public" {
  type        = string
  description = "The content of the public ssh key"
}

variable "subnet_id" {
  type        = string
  description = "The id of the subnet"
}

variable "public_ip_id" {
  type        = string
  description = "The id of the public ip"
}