variable "resource_group_data" {
  type = object({
    name     = string
    location = string
  })
  description = "The data of the resource group where resources will be created"
}

variable "vm_name" {
  type        = string
  description = "The name of the virtual machine"
}

variable "vm_size" {
  type        = string
  description = "The size of the VM"
}

variable "subnet_id" {
  type        = string
  description = "The ID of the subnet where the virtual machine will be created"
}

variable "ssh_key_public" {
  type        = string
  description = "The SSH public key for the virtual machine"
}

variable "public_ip_id" {
  type        = string
  description = "The ID of the public IP address associated with the virtual machine"
}

variable "public_ip_address" {
  type        = string
  description = "The public IP address of the virtual machine"
}
