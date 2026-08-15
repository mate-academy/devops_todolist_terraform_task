variable "install_script_url" {
  type        = string
  description = "URL to the install script used by CustomScript extension"
  default     = "https://raw.githubusercontent.com/1ntact/devops_todolist_terraform_task/main/install-app.sh"
}

variable "storage_account_name" {
  type        = string
  description = "Storage account name for state/artifacts"
  default     = "yamfilmerkil"
}

variable "location" {
  type        = string
  description = "Location of the resource group"
  default     = "denmarkeast"
}

variable "resource_group_name" {
  type        = string
  description = "Name of the resource group"
  default     = "mate-azure-task-12"
}

variable "virtual_network_name" {
  type        = string
  description = "Name of the virtual network"
  default     = "vnet"
}

variable "vnet_address_prefix" {
  type        = list(string)
  description = "Address space for the virtual network"
}

variable "subnet_name" {
  type        = string
  description = "Name of the subnet"
  default     = "default"
}

variable "subnet_address_prefix" {
  type        = list(string)
  description = "Address prefix for the subnet"
}

variable "dns_servers" {
  type        = list(string)
  description = "Optional DNS servers for the VNet/subnet"
  default     = []
}

variable "network_security_group_name" {
  type        = string
  description = "Name of the network security group"
  default     = "defaultnsg"
}

variable "public_ip_address_name" {
  type        = string
  description = "Name of the public IP"
  default     = "linuxboxpip"
}

variable "dns_label" {
  type        = string
  description = "DNS label for the public IP"
  default     = "matetask"
}

variable "vm_name" {
  type        = string
  description = "Name of the virtual machine"
  default     = "matebox"
}

variable "vm_size" {
  type        = string
  description = "Size of the virtual machine"
  default     = "Standard_B1s"
}

variable "admin_username" {
  type        = string
  description = "Admin username for the VM"
  default     = "mate"
}

variable "ssh_key_public" {
  type        = string
  description = "Public SSH key for the virtual machine"
  default     = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDeTG0Uh7IjOmZ7p6N15sWJYUGsxdGrDHQF4FqjlN75AXDnekGEFehrt2ZQjSrgGDLzgVG5iRy0FqyMt8If1/51rOXgvib5BF8+xsTR+4LTG46XYlsN2TvBHVJ1WaDGnnLNoKo3he2oa/dFdO+HF+gWYHtHJ5mNtnbNOYrRyHpc1CYdGubCjRBb3PxGtUVPQNWBYCVD+gqTdQmp5kSjJSyd542iIeGD/QolsnlNbiEyPBTrG/vCfvpDww0CujPw6FTY1JMUYGIJaFWIp2Btk9EcJKvypFu6fd9eL6+VJ/POrnD8b62bcOcAJ7neujKOu/CV6OQnbb/F3y0vwLdBfBNQpan4Pzh1XEe0lKGCC6JaRACDlCgjNxgd34O4h20y+OxxLieJy9izPQFXbkhhsl5i/mHYbvXeHETwuyDfH6gCCwciNiin3hOQqyo1KX0Pqg0//sVJtu8Ll7WRTxdNGOuHVkj0+n6oAUVdoCGEuAU6AbBykyqu1LiwohCSTzdI9EHL5VHqiY6cjxKOtZK/Q56Ov2HgWV29MK6FjnY2jpNiEBuD4WPGCsmQq2n15yt4sDIGZvXZFL2317n/pN3vH+NDAXg6RQk2OUp3ivOuKsl9WvsWr4l68jaWbvzv0EITgFOmwkWdiG7/Qw+tPHx1dyDBSeVRxoD9zBC7skbVhQpOMw== verbaivan9@gmail.com"
}

variable "os_disk_caching" {
  type        = string
  description = "OS disk caching option"
  default     = "ReadWrite"
}

variable "os_disk_storage_account_type" {
  type        = string
  description = "OS disk storage account type"
  default     = "Standard_LRS"
}

