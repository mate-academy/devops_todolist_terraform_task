terraform {
  backend "azurerm" {
    resource_group_name  = "mate-azure-task-12"
    storage_account_name = "matestorageaccount1234"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
    subscription_id      = "45bb3ad1-07fa-405a-9924-4d73f427fe82"
  }
}
