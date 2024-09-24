variable "location" {
  description = "The location where all resources will be deployed."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group that will contain all the resources."
  type        = string
}

variable "subnet_id" {
  description = "The ID of the subnet in which the virtual machine's network interface will be created."
  type        = string
}

variable "public_ip_address_id" {
  description = "The ID of the public IP address to be associated with the network interface."
  type        = string
}

variable "vm_name" {
  description = "The name of the virtual machine to be created."
  type        = string
}

variable "vm_size" {
  description = "The size of the virtual machine, such as 'Standard_B1s'."
  type        = string
}

variable "admin_username" {
  description = "The username for the admin account on the virtual machine."
  type        = string
}

variable "linuxboxsshkey" {
  description = "The SSH public key to be used for authentication to the virtual machine."
  type        = string
}

variable "blob_url" {
  description = "The URL of the blob"
  type        = string
}

variable "blob_name" {
  description = "The blob with script name"
  type        = string
}
