variable "location" {
  description = "The location of the resources"
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

variable "vm_name" {
  description = "The name of the virtual machine"
  type        = string
}

variable "vm_size" {
  description = "The size of the virtual machine"
  type        = string
}

variable "ssh_key_public" {
  description = "Content of the public SSH key"
  type        = string
}

variable "ssh_key_private" {
  description = "Path to the private SSH key"
  type        = string
}

variable "admin_username" {
  description = "The administrative username for the virtual machine"
  type        = string
}

variable "subnet_id" {
  description = "The ID of the subnet"
  type        = string
}

variable "public_ip_address_id" {
  description = "The ID of the public IP address"
  type        = string
}

variable "public_ip_address" {
  description = "The public IP address"
  type        = string
}

variable "tags" {
  description = "Tags for the resources"
  type        = map(string)
  default     = {}
}
