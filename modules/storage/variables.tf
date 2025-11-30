variable "resource_group_name" {
  description = "The name of the Azure resource group."
  type        = string
}
variable "location" {
  description = "The Azure region for deployment."
  type        = string
}
variable "storage_account_name" {
  description = "The globally unique name for the Storage Account."
  type        = string
}
variable "storage_container_name" {
  description = "The name for the storage container (task-artifacts)."
  type        = string
}