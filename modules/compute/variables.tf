variable "resource_group_name" {
  description = "Name of the resource group for the compute resources"
  type        = string
}

variable "location" {
  description = "Azure region"
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

variable "admin_username" {
  description = "Admin username for the virtual machine"
  type        = string
}

variable "ssh_key_public" {
  description = "SSH public key used for VM authentication"
  type        = string
}

variable "subnet_id" {
  description = "ID of the subnet the network interface attaches to"
  type        = string
}

variable "public_ip_id" {
  description = "ID of the public IP attached to the network interface"
  type        = string
}

variable "install_script_url" {
  description = "Raw GitHub URL of install-app.sh for the VM extension"
  type        = string
}
