terraform {
  required_version = ">= 1.8.4"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.105.0"

    }
  }

  backend "azurerm" {
    use_oidc             = true
    resource_group_name  = "mate-azure-task-12"
    storage_account_name = "electicwizard2345542356"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
  }

}

provider "azurerm" {
  features {}
}

data "archive_file" "example" {
  type        = "zip"
  source_dir  = path.module
  output_path = "${path.module}/archive.zip"
}

resource "azurerm_storage_blob" "example" {
  name                   = var.blob_name
  storage_account_name   = var.storage_account_name
  storage_container_name = var.container_name
  type                   = "Block"
  source                 = data.archive_file.example.output_path
}