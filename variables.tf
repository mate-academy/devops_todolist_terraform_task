variable "location" {
  description = "The Azure location where resources will be created."
  type        = string
  default     = "Canada Central" # Location close to Alberta, Calgary
}

variable "resource_group_name" {
  description = "The name of the resource group."
  type        = string
  default     = "terraform"
}

variable "vm_name" {
  description = "The name of the virtual machine."
  type        = string
  default     = "vr89project-vm"
}

variable "dns_label_prefix" {
  description = "The prefix for the DNS label."
  type        = string
  default     = "vr89task"
}

variable "ssh_key" {
  description = "The SSH public key for the VM."
  type        = string
}

variable "storage_account_name" {
  description = "The name of the storage account."
  type        = string
  default     = "vr89projectstorage"
}
