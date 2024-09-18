variable "vm_name" {
  type    = string
  default = "matebox"
}

variable "location" {
  type    = string
  default = "uksouth"
}

variable "resource_group_name" {
  type    = string
  default = "mate-azure-task-12"
}

variable "subnet_id" {
  type = string
}

variable "public_ip_address" {
  type = string
}

variable "vm_size" {
  type    = string
  default = "Standard_B1s"
}

variable "blob_url" {
  type        = string
}

variable "ssh_key" {
  type = string
}
