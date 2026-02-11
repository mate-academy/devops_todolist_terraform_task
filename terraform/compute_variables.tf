variable "vm_name" {
  description = "Name of the virtual machine."
  type        = string
}

variable "vm_size" {
  description = "Size/SKU of the virtual machine."
  type        = string
}

variable "admin_username" {
  description = "Admin username for the virtual machine."
  type        = string
}

variable "script_file" {
  description = "Path to the bootstrap script used on the VM."
  type        = string
}

variable "ssh_key_public_path" {
  description = "Path to the SSH public key file."
  type        = string
  default     = "../id_rsa_azure.pub"
}
