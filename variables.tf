variable "vm_name" {
  description = "The name of the virtual machine."
  type        = string
  default     = "matebox"
}

variable "dns_label" {
  description = "The prefix for the DNS label."
  type        = string
  default     = "todolist-terraform-task"
}

variable "ssh_key" {
  description = "The SSH public key for the VM."
  type        = string
}

variable "storage_account_name" {
  description = "The name of the storage account."
  type        = string
  default     = "tfstatekagerou4649"
}

variable "virtual_network_name" {
  description = "The name of the virtual network"
  type        = string
}

variable "vnet_address_prefix" {
  description = "The address prefix for the virtual network"
  type        = string
}
