variable "vm_name" {
  default = "matebox"
}

variable "ssh_key_public" {
  type = string
}

variable "subnet_id" {
  type = string
}

variable "public_ip_id" {
  type = string
}

variable "resource_group_name" {
  type = string
}

variable "location" {
  type = string
}

variable "vm_size" {
  type = string
}

variable "install_app_url" {
  type      = string
  sensitive = true
}
