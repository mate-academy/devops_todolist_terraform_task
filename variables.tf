variable "location" {
  default = "uksouth"
}

variable "resource_group_name" {
  default = "mate-azure-task-12"
}

variable "dns_label" {
  default = "matetask"
}

variable "vm_name" {
  default = "matebox"
}

variable "vm_size" {
  default = "Standard_B1s"
}

variable "ssh_key" {
  default = "sha ....."
}

variable "storage_account_name" {
  type    = string
  default = "storagemodulesouth"
}
