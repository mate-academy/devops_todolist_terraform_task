resource "azurerm_storage_account" "main" {
  name                     = var.storage_account_name
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_container" "task_artifacts" {
  name                  = var.task_artifacts_container_name
  storage_account_name  = azurerm_storage_account.main.name
  container_access_type = "private"
}

resource "azurerm_storage_container" "script" {
  name                  = "${var.storage_account_name}-script-storage"
  storage_account_name  = azurerm_storage_account.main.name
  container_access_type = "container"
}

resource "azurerm_storage_blob" "script-blob" {
  name                   = "${var.storage_account_name}-blob"
  storage_account_name   = azurerm_storage_account.main.name
  storage_container_name = azurerm_storage_container.script.name
  type                   = "Block"
  source                 = "C:/Users/User.SHU/projects/terraform/devops_todolist_terraform_task/install-app.sh"
}
