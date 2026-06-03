variable "storage_account_name" {
  type        = string
  description = "Storage Account Name"
}

variable "location" {
  type        = string
  description = "Location for storage account"
}

variable "resource_group_name" {
  type        = string
  description = "Resource Group Name"
}


variable "storage_account_tier" {
  type        = string
  default     = "Standard"
  description = "Tier for Storage Account"
}

variable "storage_account_replication_type" {
  type        = string
  default     = "LRS"
  description = "Replication for Storage Account"
}

variable "container_names" {
  type        = list(string)
  default     = ["task-artifacts", "tfstate"]
  description = "Container name inside Storage Account"
}

variable "container_access_type" {
  type        = string
  default     = "private"
  description = "Access type for container in Storage Account"
}
