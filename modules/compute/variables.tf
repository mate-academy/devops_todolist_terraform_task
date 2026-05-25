variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}

variable "location" {
  description = "Azure region for resources"
  type        = string
}

variable "vm_name" {
  description = "Name of the virtual machine"
  type        = string
}

variable "vm_size" {
  description = "Size of the virtual machine"
  type        = string
}

variable "ssh_key_public" {
  description = "Public SSH key for the virtual machine"
  type        = string
  sensitive   = true
}

variable "subnet_id" {
  description = "ID of the subnet to connect the VM to"
  type        = string
}

variable "public_ip_id" {
  description = "ID of the public IP address to associate with the VM"
  type        = string
}

# Added variable for the Network Security Group ID.
variable "nsg_id" {
  description = "ID of the Network Security Group to associate with the NIC"
  type        = string
}

variable "script_url" {
  description = "URL of the script to execute on the VM"
  type        = string
}
