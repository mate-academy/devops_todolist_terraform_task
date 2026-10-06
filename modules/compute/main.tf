resource "azurerm_network_interface" "this" {
  name                = "${var.vm_name}-nic"
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = var.public_ip_id
  }
}

resource "azurerm_linux_virtual_machine" "this" {
  name                            = var.vm_name
  computer_name                   = var.vm_name
  resource_group_name             = var.resource_group_name
  location                        = var.location
  size                            = var.vm_size
  admin_username                  = "azureuser"
  disable_password_authentication = true

  network_interface_ids = [
    azurerm_network_interface.this.id
  ]

  admin_ssh_key {
    username   = "azureuser"
    public_key = var.ssh_key_public
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts-gen2"
    version   = "latest"
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }
}

resource "azurerm_virtual_machine_extension" "this" {
  name                 = "install-todo-app"
  virtual_machine_id   = azurerm_linux_virtual_machine.this.id
  publisher            = "Microsoft.Azure.Extensions"
  type                 = "CustomScript"
  type_handler_version = "2.1"

  auto_upgrade_minor_version = true

  settings = jsonencode({
    fileUris = [
      "https://raw.githubusercontent.com/tetianamohorian23/devops_todolist_terraform_task/task-terraform-todolist/install-app.sh"
    ]

    commandToExecute = "bash install-app.sh"
  })
}
