variable "subnet_id" {
  type        = string
  description = "ID підмережі, в якій створювати NIC"
}

variable "resource_group_name" {
  type = string
}

variable "location" {
  type = string
}

variable "vm_name" {
  type = string
  default = "matebox"
}

variable "ssh_public_key_path" {
  type        = string
  description = "Локальний шлях до публічного SSH-ключа"
}

variable "script_blob_url" {
  type        = string
  description = "HTTPS URL до install-app.sh у Blob Storage"
}

variable "vm_size" {
  type = string
}