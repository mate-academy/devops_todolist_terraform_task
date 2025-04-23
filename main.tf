module "network" {
  source                      = "./modules/network"
  location                    = var.location
  resource_group_name         = var.resource_group_name
  virtual_network_name        = "vnet"
  subnet_name                 = "default"
}

module "compute" {
  source                = "./modules/compute"
  location              = var.location
  resource_group_name   = var.resource_group_name
  vm_name               = "matebox"
  subnet_id             = module.network.subnet_id
  public_ip_id          = module.network.public_ip_id
}

module "storage" {
  source                = "./modules/storage"
  location              = var.location
  resource_group_name   = var.resource_group_name
  storage_account_name  = "beliardemodemo123"
}