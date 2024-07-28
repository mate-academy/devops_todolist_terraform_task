variable "vm_name" {
  type        = string
  description = "The name of the virtual machine"
}

variable "extension_name" {
  type        = string
  description = "The name of the virtual machine extension"
}

variable "subnet_id" {
  type        = string
  description = "The ID of the subnet"
}

variable "rg_name" {
  type        = string
  description = "The name of the resource group"
}

variable "rg_location" {
  type        = string
  description = "The location of the resource group"
}

variable "blob_url" {
  type        = string
  description = "The URL of the blob"
}

variable "vm_size" {
  type        = string
  description = "The size of the virtual machine (e.g., Standard_B2s)"
}

variable "admin_username" {
  type        = string
  description = "The username for the virtual machine administrator"
}

variable "admin_password" {
  type        = string
  description = "The password for the virtual machine administrator"
}

variable "key_data" {
  type        = string
  description = "The SSH public key for the virtual machine administrator"
}

variable "public_ip_id" {
  type        = string
  description = "The ID of the public IP address"
}
