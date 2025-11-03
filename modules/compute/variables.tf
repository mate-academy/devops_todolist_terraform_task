variable "location" {
  description = "Azure region"
  type        = string
}

variable "resource_group_name" {
  description = "Resource group name"
  type        = string
}

variable "vm_name" {
  description = "Virtual machine name"
  type        = string
}

variable "vm_size" {
  description = "Virtual machine size"
  type        = string
}

variable "subnet_id" {
  description = "Subnet ID"
  type        = string
}

variable "public_ip_id" {
  description = "Public IP ID"
  type        = string
}

variable "ssh_key_public" {
  description = "Public SSH key"
  type        = string
  sensitive   = true
}

variable "environment" {
  description = "Environment name"
  type        = string
}

variable "script_uri" {
  description = "URI of the custom script to execute"
  type        = string
  default     = "https://raw.githubusercontent.com/demon9709/devops_todolist_terraform_task/master/install-app.sh"
}
