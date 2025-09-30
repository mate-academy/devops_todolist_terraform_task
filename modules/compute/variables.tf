variable "location" {
  description = "The location where resources will be created"
  type        = string
  default     = "uksouth"

}

variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
  default     = "mate-azure-task-12"

}

variable "vm_name" {
  description = "The name of the virtual machine"
  type        = string
  default     = "matebox"

}

variable "vm_size" {
  description = "The size of the virtual machine"
  type        = string
  default     = "Standard_B1s"

}

variable "ssh_key_public" {
  description = "The public SSH key for the virtual machine"
  type        = string
  default     = "~/.ssh/id_rsa.pub"

}

variable "subnet_id" {
  description = "The subnet ID where VM NIC will be attached"
  type        = string
}

variable "public_ip_id" {
  description = "The Public IP ID for NIC"
  type        = string
}