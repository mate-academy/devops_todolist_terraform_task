variable "resource_group_name" {
  type        = string
  description = "Resource group name"
}

variable "location" {
  type        = string
  description = "Azure location"
}

variable "tags" {
  type        = map(string)
  description = "Common tags"
  default     = {}
}
