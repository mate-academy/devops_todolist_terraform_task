variable "resource_group_name" {
  type = string
}

variable "storage_location" {
  type = string
}

variable "replication_type" {
  type    = string
  default = "LRS"
}

variable "container_artifacts_name" {
  type    = string
  default = "task-artifacts"
}
