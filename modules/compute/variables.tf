variable "location" {
  description = "The location where resources will be deployed"
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
  description = "The public SSH key for the virtual machine"
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

variable "blob_url" {
  description = "The URL of the blob containing the script to run"
  type        = string
}

variable "extension_name" {
  description = "The name of the VM extension"
  type        = string
}