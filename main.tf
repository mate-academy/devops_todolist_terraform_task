provider "azurerm" {
  features {}
}


# Resource group configuration
resource "azurerm_resource_group" "main" {
  name     = "terraform"
  location = "Canada Central"
  tags = {
    project     = "vr89project"
    environment = "dev"
    owner       = "vr89"
  }
}

# Call the Network module
module "network" {
  source              = "./modules/network"
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name

  dns_label_prefix = var.dns_label_prefix
}

# Call the Compute module
module "compute" {
  source              = "./modules/compute"
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
  vm_name             = var.vm_name

  subnet_id    = module.network.subnet_id
  public_ip_id = module.network.public_ip_address
  ssh_key      = var.ssh_key
}

# Call the Storage module
module "storage" {
  source               = "./modules/storage"
  location             = azurerm_resource_group.main.location
  resource_group_name  = azurerm_resource_group.main.name
  storage_account_name = var.storage_account_name
}
