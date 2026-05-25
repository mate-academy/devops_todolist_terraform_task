terraform {
  required_version = ">= 1.5.0, < 2.0.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.75"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.5"
    }
  }
}

provider "azurerm" {
  features {}
  subscription_id = var.subscription_id
}

resource "random_integer" "dns_suffix" {
  min = 1000
  max = 9999
}

locals {
  dns_label = "${var.dns_label}${random_integer.dns_suffix.result}"

  common_tags = merge(
    {
      environment = var.environment
      project     = var.resource_group_name
      managed_by  = "terraform"
    },
    var.tags
  )
}

resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
  tags     = local.common_tags
}

module "network" {
  source = "./modules/network"

  resource_group_name         = azurerm_resource_group.rg.name
  location                    = azurerm_resource_group.rg.location
  virtual_network_name        = var.virtual_network_name
  vnet_address_prefix         = var.vnet_address_prefix       # fixed: was [var.vnet_address_prefix]
  subnet_name                 = var.subnet_name
  subnet_address_prefix       = var.subnet_address_prefix     # fixed: was [var.subnet_address_prefix]
  network_security_group_name = var.network_security_group_name
  public_ip_address_name      = var.public_ip_address_name
  dns_label                   = local.dns_label               # fixed: now globally unique
}

module "storage" {
  source = "./modules/storage"

  resource_group_name    = azurerm_resource_group.rg.name
  location               = azurerm_resource_group.rg.location
  storage_account_name   = var.storage_account_name           # fixed: matched to variable name below
  storage_container_name = var.storage_container_name         # fixed: matched to variable name below
}

module "compute" {
  source = "./modules/compute"

  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  vm_name             = var.vm_name
  vm_size             = var.vm_size
  ssh_key_public      = var.ssh_key_public
  subnet_id           = module.network.subnet_id
  public_ip_id        = module.network.public_ip_id
  nsg_id              = module.network.nsg_id
  script_url          = module.storage.script_url
}