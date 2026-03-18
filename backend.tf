terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.63.0"
    }
  }

  backend "azurerm" {
    resource_group_name  = "mate-azure-task-12"
    storage_account_name = "vsupruniukmatetask"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"

    use_oidc = true
  }
}

provider "azurerm" {
  features {}

  use_oidc = true
}
