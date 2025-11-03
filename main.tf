terraform {
  required_version = ">= 1.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.0"
    }
  }
}

provider "azurerm" {
  features {}
}


provider "random" {}

resource "random_string" "storage_suffix" {
  length  = 8
  special = false
  upper   = false
}

module "network" {
  source = "./modules/network"

  location                    = var.location
  resource_group_name         = var.resource_group_name
  virtual_network_name        = var.virtual_network_name
  vnet_address_prefix         = var.vnet_address_prefix
  subnet_name                 = var.subnet_name
  subnet_address_prefix       = var.subnet_address_prefix
  network_security_group_name = var.network_security_group_name
  public_ip_address_name      = var.public_ip_address_name
  dns_label                   = var.dns_label
  environment                 = var.environment
}

module "storage" {
  source = "./modules/storage"

  location             = var.location
  resource_group_name  = var.resource_group_name
  storage_account_name = "${replace(var.storage_account_name, "-", "")}${random_string.storage_suffix.result}"
  environment          = var.environment

  depends_on = [module.network]
}

module "compute" {
  source = "./modules/compute"

  location            = var.location
  resource_group_name = var.resource_group_name
  vm_name             = var.vm_name
  vm_size             = var.vm_size
  subnet_id           = module.network.subnet_id
  public_ip_id        = module.network.public_ip_id
  ssh_key_public      = var.ssh_key_public
  environment         = var.environment

  depends_on = [module.network]
}
