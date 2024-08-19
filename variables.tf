variable "region" {
  description = "Azure Region"
  default     = "uksouth"
  validation {
    condition = contains(
      [
        "eastus", "eastus2", "southcentralus", "westus2", "westus3", "australiaeast", "southeastasia", "northeurope", "swedencentral", "uksouth", "westeurope",
        "centralus", "southafricanorth", "centralindia", "eastasia", "japaneast", "koreacentral", "canadacentral", "francecentral", "germanywestcentral",
        "italynorth", "norwayeast", "polandcentral", "spaincentral", "switzerlandnorth", "mexicocentral", "uaenorth", "brazilsouth", "israelcentral", "qatarcentral",
        "centralusstage", "eastusstage", "eastus2stage", "northcentralusstage", "southcentralusstage", "westusstage", "westus2stage", "asia", "asiapacific",
        "australia", "brazil", "canada", "europe", "france", "germany", "global", "india", "israel", "italy", "japan", "korea", "newzealand", "norway",
        "poland", "qatar", "singapore", "southafrica", "sweden", "switzerland", "uae", "uk", "unitedstates", "unitedstateseuap", "eastasiastage",
        "southeastasiastage", "brazilus", "eastusstg", "northcentralus", "westus", "japanwest", "jioindiawest", "centraluseuap", "eastus2euap",
        "westcentralus", "southafricawest", "australiacentral", "australiacentral2", "australiasoutheast", "jioindiacentral", "koreasouth", "southindia",
        "westindia", "canadaeast", "francesouth", "germanynorth", "norwaywest", "switzerlandwest", "ukwest", "uaecentral", "brazilsoutheast"
      ], var.region
    )
    error_message = (
      <<EOF
      The region name must be one of the allowed regions.

      Follow the Link to see available region Names
      https://github.com/YegorVolkov/az_regions
      EOF
    )
  }
}

variable "rg_name" {
  description = "The name of the resource group"
  type        = string
  default     = "mate-azure-task-12"
  validation {
    condition = (
      length(var.rg_name) >= 1 &&
      length(var.rg_name) <= 90 &&
      can(regex("^[a-zA-Z0-9-_]+$", var.rg_name)) &&
      !can(regex("\\s", var.rg_name))
    )
    error_message = (
      <<EOF
        The resource group name must be between 1 and 90 characters long;
        can only contain alphanumeric characters, hyphens `-`, and underscores `_`;
        spaces are not allowed.
      EOF
    )
  }
}

/*
     _____________________________________________________
    / *|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|* \

    Module variables below
    All validations for them are processed in the modules

*/

variable "vnet_name" {
  default = "vnet"
}

variable "vnet_address_space" {
  default = ["10.0.0.0/16"]
}

variable "subnet_name" {
  default = "default"
}

variable "subnet_address_prefixes" {
  default = ["10.0.0.0/24"]
}

variable "pubip_name" {
  default = "linuxboxpip"
}

variable "nsg_name" {
  default = "defaultnsg"
}

variable "pubip_dns_prefix" {
  default = "matetask"
}

variable "nic_ip_conf_name" {
  default = "ipconfig1"
}

variable "vm_name" {
  default = "matebox"
}

variable "vm_size" {
  default = "Standard_B1s"
}

variable "vm_user_name" {
  default   = "yegor"
  sensitive = true
}

variable "vm_user_password" {
  default   = "P@sswor9.!@#"
  sensitive = true
}

variable "container_name" {
  default = "installer"
}

variable "blob_name" {
  default = "install-app.sh"
}

variable "blob_source" {
  default = "C:\\study\\MateStudy\\Terraform\\devops_todolist_terraform_task\\install-app.sh"
}
