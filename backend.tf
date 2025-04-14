terraform {
  # backend "local" {
  #   path = "./terraform/terraform.tfstate"
  # }

  backend "azurerm" {
    storage_account_name = "matestorageaccount12345"
    container_name       = "tfstate "
    key                  = "terraform.tfstate"
    resource_group_name  = "mate-azure-task-12"
    subscription_id      = "ba182160-e785-4e7c-b8ce-66187bbc50cc"
    use_oidc             = true
  }
}