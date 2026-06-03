variable "resource_group_name" {
  type        = string
  description = "Name of Resouce Group"
}

variable "network_security_group_id" {
  type        = string
  description = "Security Group ID"
}

variable "location" {
  type        = string
  description = "Resources location"
}

variable "ip_configuration_name" {
  type    = string
  default = "internal"
}

variable "subnet_id" {
  type        = string
  description = "Subnet id in what network interface will be located"
}

variable "private_ip_address_allocation" {
  type        = string
  default     = "Dynamic"
  description = "Network interface private ID allocation method. Could be Static or Dynamic"
}

variable "public_ip_address_id" {
  type        = string
  description = "Piblic IP adress Id"
}

variable "ssh_key_name" {
  type    = string
  default = "linuxboxsshkey"
}

variable "vm_name" {
  type    = string
  default = "matebox"
}


variable "vm_size" {
  type        = string
  default     = "Standard_B1s"
  description = "Virtual Machine Size"
}

variable "admin_username" {
  type        = string
  description = "Admin username for Virtual Machine"
}


variable "os_disk_caching" {
  type        = string
  default     = "ReadWrite"
  description = "Type of Caching which should be used for the Internal OS Disk. Possible Values: None, ReadOnly, ReadWrite"
}


variable "os_disk_storage_account_type" {
  type        = string
  default     = "Standard_LRS"
  description = "Type of Storage Account which should back this the Internal OS Disk. Possible values are Standard_LRS, StandardSSD_LRS, Premium_LRS, StandardSSD_ZRS and Premium_ZRS"
}

variable "path_to_ssh_key" {
  type        = string
  description = "Path on local machine to ssh key"
}

variable "os_publisher" {
  type        = string
  default     = "canonical"
  description = "Specifies the publisher of the image used to create the virtual machines. Changing this forces a new resource to be created."
}

variable "os_offer" {
  type        = string
  default     = "ubuntu-22_04-lts"
  description = "Specifies the offer of the image used to create the virtual machines. Changing this forces a new resource to be created."
}

variable "os_sku" {
  type        = string
  default     = "server-gen1"
  description = "Specifies the SKU of the image used to create the virtual machines. Changing this forces a new resource to be created."
}

variable "os_version" {
  type        = string
  default     = "latest"
  description = "Specifies the version of the image used to create the virtual machines. Changing this forces a new resource to be created."
}

variable "extension_name" {
  type        = string
  default     = "customscript"
  description = "Name of Virtual Machine Extension"
}

variable "extension_publisher" {
  type        = string
  default     = "Microsoft.Azure.Extensions"
  description = "Extension Publisher Name"
}

variable "extension_type" {
  type        = string
  default     = "CustomScript"
  description = "Type of extension"
}

variable "extension_type_handler_version" {
  type        = string
  default     = "2.0"
  description = "version of extension handler"
}


variable "extension_settings" {
  type = object(
    {
      fileUris         = list(string)
      commandToExecute = string
    }
  )
  default = {
    fileUris         = ["https://raw.githubusercontent.com/Killingrace/devops_todolist_terraform_task/main/install-app.sh"]
    commandToExecute = "./install-app.sh"
  }
  description = "json data for custom script"
}