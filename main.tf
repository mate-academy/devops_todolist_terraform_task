# 1. PROVIDERS AND RESOURCE GROUP
provider "azurerm" {
  features {}
}

# Resource Group
resource "azurerm_resource_group" "main" {
  name     = var.resource_group_name
  location = var.location
}

# Helper resource for a unique DNS label
resource "random_integer" "dns_suffix" {
  min = 1000
  max = 9999
}

# 2. NETWORK MODULE CALL
module "network" {
  source = "./modules/network"

  resource_group_name         = azurerm_resource_group.main.name
  location                    = azurerm_resource_group.main.location
  virtual_network_name        = var.virtual_network_name
  vnet_address_prefix         = var.vnet_address_prefix
  subnet_name                 = var.subnet_name
  subnet_address_prefix       = var.subnet_address_prefix
  network_security_group_name = var.network_security_group_name
  public_ip_address_name      = var.public_ip_address_name
  dns_label                   = "${var.dns_label}-${random_integer.dns_suffix.result}"
}

# 3. STORAGE MODULE CALL
module "storage" {
  # CORRECTED path based on your file structure
  source = "./modules/storage"

  resource_group_name    = azurerm_resource_group.main.name
  location               = azurerm_resource_group.main.location
  storage_account_name   = var.storage_account_name
  storage_container_name = var.storage_container_name
}

# 4. COMPUTE MODULE CALL
module "compute" {
  source = "./modules/compute"

  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location
  vm_name             = var.vm_name
  vm_size             = var.vm_size
  admin_username      = "azureuser"
  ssh_key_public      = var.ssh_key_public

  subnet_id    = module.network.subnet_id
  public_ip_id = module.network.public_ip_id
  nsg_id       = module.network.nsg_id

  storage_account_name   = module.storage.storage_account_name
  storage_container_name = module.storage.storage_container_name

  script_path = "${path.root}/install-app.sh"
}