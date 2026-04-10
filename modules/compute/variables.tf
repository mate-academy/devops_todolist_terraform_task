variable "resource_group_name" {
  type = string
}

variable "location" {
  type = string
}

variable "vm_name" {
  type = string
}

variable "vm_size" {
  type = string
}

variable "ssh_key_public" {
  type      = string
  sensitive = true
}

variable "subnet_id" {
  type = string
}

variable "public_ip_id" {
  type = string
}

variable "github_repo_url" {
  type = string
}
