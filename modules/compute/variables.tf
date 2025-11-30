variable "resource_group_name" {
  description = "The name of the Azure resource group."
  type        = string
}
variable "location" {
  description = "The Azure region for deployment."
  type        = string
}
variable "vm_name" {
  description = "The name of the Virtual Machine (matebox)."
  type        = string
}
variable "vm_size" {
  description = "The size of the VM (Standard_B1s)."
  type        = string
}
variable "admin_username" {
  description = "The admin username for the VM."
  type        = string
}
variable "ssh_key_public" {
  description = "The public SSH key content for authentication."
  type        = string
}

# Inputs from the Network Module
variable "subnet_id" {
  description = "The ID of the Subnet to attach the NIC to."
  type        = string
}
variable "public_ip_id" {
  description = "The ID of the Public IP to attach to the NIC."
  type        = string
}
variable "nsg_id" {
  description = "The ID of the NSG to attach to the NIC."
  type        = string
}

# Inputs from the Storage Module (for CustomScript file transfer)
variable "storage_account_name" {
  description = "The name of the Storage Account."
  type        = string
}
variable "storage_container_name" {
  description = "The name of the Storage Container."
  type        = string
}
variable "script_path" {
  description = "The local path to the install-app.sh script."
  type        = string
}