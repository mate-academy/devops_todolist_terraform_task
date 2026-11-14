variable "resource_group_name" {
  type        = string
  description = "The name of the resource group in which to create the compute resources."
}

variable "location" {
  type        = string
  description = "The Azure region in which to create the compute resources."
}

variable "vm_name" {
  type        = string
  description = "The name of the virtual machine."
}

variable "vm_size" {
  type        = string
  description = "The size of the virtual machine."
}

variable "subnet_id" {
  type        = string
  description = "The ID of the subnet to which the network interface will be attached."
}

variable "public_ip_id" {
  type        = string
  description = "The ID of the public IP address to be associated with the virtual machine."
}

variable "ssh_key_public" {
  type        = string
  description = "The public SSH key content to be used for the virtual machine."
}

variable "install_script_url" {
  type        = string
  description = "The URL of the script to be executed by the custom script extension."
}
