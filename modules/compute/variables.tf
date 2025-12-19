variable "resource_group_name" {
  type        = string
  description = "Resource group name"
}

variable "location" {
  type        = string
  description = "Azure location"
}

variable "tags" {
  type        = map(string)
  description = "Common tags"
  default     = {}
}

variable "vm_name" {
  type        = string
  description = "VM name (should be matebox for this task)"
  default     = "matebox"
}

variable "admin_username" {
  type        = string
  description = "Admin username for the VM"
  default     = "azureuser"
}

variable "ssh_key_public" {
  type = string
}

variable "vm_size" {
  type = string
}

variable "subnet_id" {
  type        = string
  description = "Subnet ID where NIC will be placed"
}

variable "public_ip_id" {
  type        = string
  description = "Public IP ID to attach to the NIC"
}

variable "install_script_path" {
  type        = string
  description = "Path (relative to the module) to install-app.sh"
  default     = "install-app.sh"
}
