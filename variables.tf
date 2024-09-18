variable "location" {
  type    = string
  default = "uksouth"
}

variable "resource_group_name" {
  type    = string
  default = "mate-azure-task-12"
}

variable "virtual_network_name" {
  type    = string
  default = "vnet"
}

variable "vnet_address_prefix" {
  type    = string
  default = "10.0.0.0/16"
}

variable "subnet_name" {
  type    = string
  default = "default"
}

variable "subnet_address_prefix" {
  type    = string
  default = "10.0.0.0/24"
}

variable "network_security_group_name" {
  type    = string
  default = "defaultnsg"
}

variable "subnet_id" {
  type    = string
  default = "subnetlinuxboxpip"
}

variable "public_ip_address_id" {
  type    = string
  default = "linuxboxpip"
}

variable "dns_label" {
  type    = string
  default = "dnslabel"
}

variable "vm_name" {
  type    = string
  default = "matebox"
}

variable "vm_size" {
  type    = string
  default = "Standard_B1s"
}

variable "ssh_key" {
  type    = string
  default = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDBJBWs6h52TO/fGZRUrn5a4KNiT39eQSL0rVrc6bNtp43f1d0Tzuk0hupP10NHUUlHT2qr5kwEJ5VWlXStdm5ecZbp1aUDVNHM8NauNYiqYhSFyJbowXFCCuoRQKysWvkTR9lFZXywWfUCjKbYhZnfrYfyzGKV6I5mfRV5sBqalK9e9poRPJCU+BQ77ymNipnO5sx8tKgCyYLOqnTrr1WuEE9/HRjy+et4Uuo9kyRSY7eSKmmp+WekciLZfJWRX6h2nu0WQ6Etlw9drHUh7ghYG4QXA8qPgfDcPwyjap8inM2X7VeT0Wq6a5ws/JLm2wky4BnT9B3oacdXjvZ3BrDRmEY0It9k0maCYb8et7MOt/Ua5O80T6160OsvEH5oIss2PRLh/ECDRQ6W8+EVQZvtgpdswAtW7koKyIsSmI3rrSSGyhlTC9IrZC+KO5yb2AQvhSdYFk5IIcf7SvcxDl803yjP+KYBy8STd31AUPqjQ0SKIRgYAhEAKKOv1y59oOM= serveladus@Serveladus-PC"
}

variable "blob_url" {
  type    = string
  default = "https://raw.githubusercontent.com/mate-academy/devops_todolist_terraform_task/main/install-app.sh"
}

variable "storage_account_name" {
  type    = string
  default = "taskartifacts"
}

variable "storage_container_name" {
  type    = string
  default = "tfstate"
}

variable "source_file_path" {
  type    = string
  default = "https://raw.githubusercontent.com/mate-academy/devops_todolist_terraform_task/main/install-app.sh"
}
