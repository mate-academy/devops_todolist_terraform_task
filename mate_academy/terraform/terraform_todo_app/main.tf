terraform {
  required_version = ">= 1.5.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.52"
    }
  }
}

provider "azurerm" {
  subscription_id = var.subscription_id
  tenant_id       = var.tenant_id
  features {}
}
# 1) Resource Group
resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
  tags     = { owner = "vitaliy", app = "todo" }
}

# 2) Мережевий модуль: VNet, Subnet, NSG, Public IP + FQDN
module "network" {
  source = "./modules/network"

  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location

  virtual_network_name = var.virtual_network_name
  vnet_address_prefix  = var.vnet_address_prefix

  subnet_name           = var.subnet_name
  subnet_address_prefix = var.subnet_address_prefix

  nsg_name       = var.network_security_group
  public_ip_name = var.public_ip_name
  dns_label_base = var.dns_label
}

# 3) Сховище для артефактів: SA + контейнер
module "storage" {
  source = "./modules/storage"

  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location

  storage_account_name = "todostate${module.network.rand_suffix}"
  container_name       = "task-artifacts"
}

# 4) Обчислення: NIC, VM, CustomScript extension
module "compute" {
  source = "./modules/compute"

  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location

  vm_name        = var.vm_name
  vm_size        = var.vm_size
  admin_username = "azureuser"
  ssh_key_public = var.ssh_key_public

  subnet_id    = module.network.subnet_id
  nsg_id       = module.network.nsg_id
  public_ip_id = module.network.public_ip_id

  install_script_url = var.install_script_url
}

output "public_ip" {
  value = module.network.public_ip_address
}

output "fqdn" {
  value = module.network.fqdn
}
