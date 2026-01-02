terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.6"
    }
  }
}

provider "azurerm" {
  features {}
  subscription_id = "2beb95a1-e310-40c7-926c-e1fc7424d0e4"
}


resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
}

resource "random_integer" "dns" {
  min = 100
  max = 99999
}

locals {
  dns_label_final = "${var.dns_label}${random_integer.dns.result}"
}

module "network" {
  source = "./modules/network"

  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  virtual_network_name  = var.virtual_network_name
  vnet_address_prefix   = var.vnet_address_prefix
  subnet_name           = var.subnet_name
  subnet_address_prefix = var.subnet_address_prefix

  network_security_group_name = var.network_security_group_name
  public_ip_address_name      = var.public_ip_address_name
  dns_label                   = local.dns_label_final
}

module "compute" {
  source = "./modules/compute"

  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  vm_name = var.vm_name
  vm_size = var.vm_size

  subnet_id    = module.network.subnet_id
  public_ip_id = module.network.public_ip_id

  ssh_key_name   = "linuxboxsshkey"
  ssh_public_key = var.ssh_key_public

  install_script_url = "https://raw.githubusercontent.com/maximprysyazhnikov/devops_todolist_terraform_task/main/install-app.sh"
}


module "storage" {
  source = "./modules/storage"

  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  container_name = "task-artifacts"
}
