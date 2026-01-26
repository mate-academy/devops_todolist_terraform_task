terraform {
  required_version = ">= 1.8.4"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.6"
    }
  }
}

provider "azurerm" {
  features {}
  use_oidc = true
}

# 1) Resource Group
resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
}

# 2) Storage module 
module "storage" {
  source              = "./modules/storage"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location

  storage_account_name = var.storage_account_name
  container_name       = var.storage_container_name
}

# 3) Network module
module "network" {
  source              = "./modules/network"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location

  vnet_name          = var.vnet_name
  vnet_address_space = var.vnet_address_space

  subnet_name           = var.subnet_name
  subnet_address_prefix = var.subnet_address_prefix

  nsg_name         = var.nsg_name
  public_ip_name   = var.public_ip_name
  dns_label_prefix = var.dns_label_prefix
}

# 4) Compute module (VM + extension)
module "compute" {
  source              = "./modules/compute"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location

  subnet_id    = module.network.subnet_id
  public_ip_id = module.network.public_ip_id

  nic_name       = var.nic_name
  vm_name        = var.vm_name
  vm_size        = var.vm_size
  admin_username = var.admin_username

  ssh_public_key = var.ssh_public_key

  # URL на install-app.sh
  install_script_url = "https://raw.githubusercontent.com/${var.github_owner}/${var.github_repo}/${var.github_ref}/install-app.sh"

  depends_on = [module.network]
}
