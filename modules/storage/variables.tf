variable "resource_group_data" {
  type = object({
    name     = string
    location = string
  })
  description = "The data of the resource group where resources will be created"
}

variable "sc_name" {
  type        = string
  description = "The name of the storage container"
}

variable "sa_name" {
  type        = string
  description = "The name of the storage account"
}
