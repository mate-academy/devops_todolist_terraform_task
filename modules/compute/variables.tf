variable "resource_group_name" {
  description = "The name of the resource group."
  type        = string
}

variable "location" {
  description = "The location of the resource group."
  type        = string
}

variable "subnet_id" {
  description = "The location of the resource group."
  type        = string
}

variable "network_security_group_id" {
  description = "The location of the resource group."
  type        = string
}

variable "vm_name" {
  description = "The name of the network interface."
  type        = string
  default     = "matebox"
}

variable "ssh_public_key" {
  description = "The SSH public key for the virtual machine"
  type        = string
}

variable "vm_extension_name" {
  description = "The SSH public key for the virtual machine"
  type        = string
  default     = "vmextension"
}

variable "vm_size" {
  description = "The SSH public key for the virtual machine"
  type        = string
  default     = "Standard_B1s"
}

variable "public_ip_address_id" {
  description = "The public IP address id."
  type        = string
}

