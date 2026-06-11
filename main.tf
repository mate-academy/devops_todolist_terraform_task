provider "azurerm" {
  features {
    resource_group {
      prevent_deletion_if_contains_resources = false
    }
  }
}

resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
}

module "network" {
  source              = "./modules/network"
  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name
  vnet_name           = var.virtual_network_name
  subnet_name         = var.subnet_name
  nsg_name            = var.network_security_group_name
  public_ip_name      = var.public_ip_address_name
  dns_label           = var.dns_label
}

module "storage" {
  source                 = "./modules/storage"
  location               = var.location
  resource_group_name    = azurerm_resource_group.rg.name
  storage_account_name   = "mateazuretask12storage"
  storage_container_name = "task-artifacts"
}

module "compute" {
  source              = "./modules/compute"
  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name
  vm_name             = var.vm_name
  vm_size             = var.vm_size
  admin_username      = "azureuser"
  ssh_key_public      = var.ssh_key_public
  subnet_id           = module.network.subnet_id
  public_ip_id        = module.network.public_ip_id
  script_url          = module.storage.script_url
}