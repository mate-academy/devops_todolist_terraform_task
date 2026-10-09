variable "resource_group_name" {
  description = "Name of the resource group where the VM and related resources will be created"
  type        = string
}

variable "location" {
  description = "Azure region where the VM will be deployed"
  type        = string
}

variable "subnet_id" {
  description = "ID of the subnet the VM's network interface will be attached to"
  type        = string
}

variable "public_ip_address_id" {
  description = "ID of the public IP address to associate with the VM's network interface"
  type        = string
}

variable "vm_name" {
  description = "Name of the virtual machine"
  type        = string
}

variable "vm_size" {
  description = "Azure VM size, e.g. Standard_B1s"
  type        = string
}

variable "admin_username" {
  description = "Admin username for SSH access to the VM"
  type        = string
}

variable "ssh_key" {
  description = "Public SSH key used for admin authentication to the VM"
  type        = string
}

variable "ssh_key_public_name" {
  type = string
}

variable "install_script_path" {
  description = "Path to the install-app.sh script"
  type        = string
  default     = "install-app.sh"
}