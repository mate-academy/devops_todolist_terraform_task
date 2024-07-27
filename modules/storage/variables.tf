variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

variable "location" {
  description = "The location where resources will be deployed"
  type        = string
}

variable "container_name" {
  description = "The name of the storage container"
  type        = string
}

variable "source_file_path" {
  description = "The path to the source file to upload"
  type        = string
}