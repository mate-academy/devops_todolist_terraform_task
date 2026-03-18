resource "azurerm_network_interface" "vm_nic" {
  name = "${var.vm_name}-nic"

  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = "internal"
    private_ip_address_allocation = "Dynamic"
    subnet_id                     = var.subnet_id
    public_ip_address_id          = var.public_ip_address_id
  }
}

resource "azurerm_network_interface_security_group_association" "sg_nic_association" {
  network_interface_id      = azurerm_network_interface.vm_nic.id
  network_security_group_id = var.network_security_group_id
}

resource "azurerm_ssh_public_key" "ssh_key" {
  name = "${var.vm_name}-ssh-key"

  location            = var.location
  resource_group_name = var.resource_group_name
  public_key          = file(var.ssh_key_path)
}

resource "azurerm_linux_virtual_machine" "vm" {
  name = var.vm_name

  location            = var.location
  resource_group_name = var.resource_group_name
  size                = var.vm_size
  admin_username      = var.admin_username

  network_interface_ids = [azurerm_network_interface.vm_nic.id]

  admin_ssh_key {
    public_key = azurerm_ssh_public_key.ssh_key.public_key
    username   = var.admin_username
  }

  os_disk {
    caching              = "ReadOnly"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = var.source_image_reference.publisher
    offer     = var.source_image_reference.offer
    sku       = var.source_image_reference.sku
    version   = var.source_image_reference.version
  }
}

resource "azurerm_virtual_machine_extension" "install_app" {
  name                 = "${var.vm_name}-install-app"
  publisher            = "Microsoft.Azure.Extensions"
  type                 = "CustomScript"
  type_handler_version = "2.1"

  virtual_machine_id = azurerm_linux_virtual_machine.vm.id
  settings = jsonencode({
    fileUris = [
      "https://raw.githubusercontent.com/vsupruniuk/devops_todolist_terraform_task/development/install-app.sh"
    ]
    commandToExecute = "bash install-app.sh"
  })
}
