variable "vm_name" {
  type        = string
  description = "Name of the virtual machine"
}

variable "location" {
  type        = string
  description = "Location for the resources"
}

variable "resource_group_name" {
  type        = string
  description = "Name of the resource group"
}

variable "subnet_id" {
  type        = string
  description = "Id of the subnet"
}

variable "vm_size" {
  type        = string
  description = "Size of the virtual machine"
}

variable "source_image_reference" {
  type = object({
    publisher = string
    offer     = string
    sku       = string
    version   = string
  })
  description = "Virtual machine image configuration"
}

variable "admin_username" {
  type        = string
  description = "Username of the virtual machine admin user"
}

variable "ssh_key_path" {
  type        = string
  description = "Path to the local ssh key"
}

variable "public_ip_address_id" {
  type        = string
  description = "Id of public ip address"
}

variable "network_security_group_id" {
  type        = string
  description = "Id of the network security group"
}
