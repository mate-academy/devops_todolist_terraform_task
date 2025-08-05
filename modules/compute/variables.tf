variable "resource_group_name" {
  description = "The name of the resource group in which the virtual machine will be created."
  type        = string
  default     = "mate-azure-task-12"
}

variable "location" {
  description = "The Azure region where the resources will be created."
  type        = string

}

variable "vm_name" {
  description = "The name of the virtual machine."
  type        = string
  default     = "matebox"
}

variable "vm_size" {
  description = "The size of the virtual machine."
  type        = string
  default     = "Standard_B1s"

}

variable "admin_username" {
  description = "The administrator username for the virtual machine."
  type        = string
  default     = "azureuser"

}

variable "ssh_public_key" {
  description = "The SSH public key for the virtual machine."
  type        = string
  default     = "linuxboxsshkey"
}

variable "subnet_id" {
  description = "The ID of the subnet where the virtual machine will be deployed."
  type        = string
}

variable "public_ip_address_id" {
  description = "The ID of the public IP address associated with the virtual machine."
  type        = string
}
