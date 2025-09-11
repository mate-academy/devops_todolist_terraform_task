terraform {
  required_version = ">= 1.5.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.100"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.5"
    }
  }
}

provider "azurerm" {
  features {}
}

# Random для DNS-лейбла
resource "random_integer" "dns_suffix" {
  min = 1000
  max = 9999
}

resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
}

module "network" {
  source = "./modules/network"

  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name
}


module "storage" {
  source = "./modules/storage"

  resource-location      = var.location
  resource-group-name   = azurerm_resource_group.rg.name
}

module "compute" {
  source = "./modules/compute"
  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name
  ssh_public_key      = var.ssh_public_key
  subnet_id           = module.network.subnet_id
  public_ip_id        = module.network.public_ip
}
