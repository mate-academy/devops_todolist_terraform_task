variable "vm_name" {
  description = "The name of the virtual machine."
  type        = string
}
variable "location" {
  description = "The location of the virtual machine."
  type        = string
}
variable "resource_group_name" {
  description = "The name of the resource group."
  type        = string
}
variable "subnet_id" {
  description = "The ID of the subnet."
  type        = string
}
variable "pip_id" {
  description = "The ID of the public ip address"
  type        = string
}
variable "vm_size" {
  description = "The size of the virtual machine."
  type        = string
}
variable "ssh_key_public" {
  description = "The public SSH key for the virtual machine."
  type        = string
}
