variable "location" {
  type = string
}

variable "resource_group_name" {
  type = string
}

variable "vm_name" {
  type = string
}

variable "vm_size" {
  type = string
}

variable "subnet_id" {
  type = string
}

variable "public_ip_id" {
  type = string
}

variable "ssh_key_name" {
  type = string
}

variable "ssh_public_key" {
  type      = string
  sensitive = true
}

variable "install_script_url" {
  type = string
}
