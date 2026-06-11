variable "location" {
  description = "The Azure region in which to create the virtual machine."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group in which to create the virtual machine."
  type        = string
}

variable "vm_name" {
  description = "The name of the virtual machine."
  type        = string
}

variable "vm_size" {
  description = "The size of the virtual machine."
  type        = string
  default     = "Standard_DS1_v2"
}

variable "admin_username" {
  description = "The admin username for the virtual machine."
  type        = string
}

variable "ssh_key_public" {
  description = "The path to the SSH public key to use for authentication."
  type        = string
}

variable "subnet_id" {
  description = "The ID of the subnet in which to create the network interface."
  type        = string
}

variable "public_ip_id" {
  description = "The ID of the public IP address to associate with the network interface."
  type        = string
}

variable "script_url" {
  description = "The URL of the install script in Azure Blob Storage."
  type        = string
}