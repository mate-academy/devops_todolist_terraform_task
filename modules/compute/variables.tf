variable "admin_username" {
  type = string
}
variable "resource_group_name" {
  description = "Name of the resource group"
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
variable "install_script_url" {
  description = "URL of install-app.sh"
  type        = string
}
variable "vm_size" {
  description = "vm size"
  type        = string
}
variable "ssh_key_public" {
  description = "Public SSH key content"
  type        = string
}
variable "subnet_id" {
  description = "ID of the subnet"
  type        = string
}
variable "public_ip_id" {
  description = "ID of the public IP address"
  type        = string
}
variable "network_security_group_id" {
  description = "ID of the network security group"
  type        = string
}
