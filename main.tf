provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
}

module "network" {
  source                      = "./modules/network"
  location                    = var.location
  resource_group_name         = azurerm_resource_group.rg.name
  virtual_network_name        = var.virtual_network_name
  vnet_address_prefix         = var.vnet_address_prefix
  subnet_name                 = var.subnet_name
  subnet_address_prefix       = var.subnet_address_prefix
  network_security_group_name = var.network_security_group_name
  public_ip_address_name      = var.public_ip_address_name
  dns_label                   = var.dns_label
}

module "compute" {
  source               = "./modules/compute"
  location             = var.location
  resource_group_name  = azurerm_resource_group.rg.name
  vm_name              = var.vm_name
  vm_size              = var.vm_size
  ssh_key_public       = var.ssh_key_public
  subnet_id            = module.network.subnet_id
  public_ip_address_id = module.network.pip_id
  blob_url             = module.storage.blob_url
  extension_name       = var.extension_name
}

module "storage" {
  source              = "./modules/storage"
  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name
  container_name      = "task-artifacts"
  source_file_path    = "C:\\Users\\ipppk\\devops_todolist_terraform_task\\install-app.sh"
}

output "blob_url" {
  value = module.storage.blob_url
}
