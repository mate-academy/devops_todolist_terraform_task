variable "vm_name" {
  description = "The name of the virtual machine."
  type        = string
  default     = "panchak-vm"
}

variable "dns_label" {
  description = "The prefix for the DNS label."
  type        = string
  default     = "todolist-terraform-task-panchak"
}

variable "ssh_key" {
  description = "The SSH public key for the VM."
  type        = string
}

variable "storage_account_name" {
  description = "The name of the storage account."
  type        = string
  default     = "lvkzxjncklvjn"
}

