terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.36.0"
    }
  }
}

provider "azurerm" {
  features {}
  subscription_id = "7b4ebbe8-4b86-45de-b81c-6f4119998725"
}

resource "random_integer" "suffix" {
  min = 1000
  max = 9999
}

resource "azurerm_resource_group" "main" {
  name     = var.resource_group_name
  location = var.location
}

module "network" {
  source                  = "./modules/network"
  location                = var.location
  network_name            = var.virtual_network_name
  nsg_name                = var.network_security_group_name
  subnet_name             = var.subnet_name
  subnet_address_prefixes = var.subnet_address_prefix
  public_ip_name          = var.public_ip_address_name
  vnet_address_space      = var.vnet_address_prefix
  resource_group_name     = var.resource_group_name
  dns_label               = "${var.dns_label}-${random_integer.suffix.result}"
}

module "compute" {
  source               = "./modules/compute"
  location             = var.location
  resource_group_name  = var.resource_group_name
  vm_name              = var.vm_name
  subnet_id            = module.network.subnet_id
  public_ip_address_id = module.network.public_ip_address_id
  vm_size              = var.vm_size
  ssh_public_key       = var.ssh_key_public
  admin_username       = var.admin_username
}

module "storage" {
  source               = "./modules/storage"
  location             = var.location
  resource_group_name  = var.resource_group_name
  storage_account_name = var.storage_account_name
  container_name       = var.container_name
}