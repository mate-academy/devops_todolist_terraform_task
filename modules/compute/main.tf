resource "azurerm_public_ip" "linuxboxpip" {
  name                = "${var.vm_name}-public-ip"
  location            = var.location
  resource_group_name = var.resource_group_name
  allocation_method   = "Dynamic"
  sku                 = "Basic"
}


resource "azurerm_network_interface" "nic" {
  name                = "${var.vm_name}-nic"
  location            = var.location
  resource_group_name = var.resource_group_name
  ip_configuration {
    name                          = "internal"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.linuxboxpip.id
  }
}

resource "azurerm_linux_virtual_machine" "vm" {
  name                            = var.vm_name
  location                        = var.location
  resource_group_name             = var.resource_group_name
  network_interface_ids           = [azurerm_network_interface.nic.id]
  size                            = var.vm_size
  disable_password_authentication = false

  #computer_name  = var.vm_name
  admin_username = "adminuser"
  admin_password = "P@ssw0rd1234"


  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }

  os_disk {
    name                 = "vm-disk-module"
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }
  tags = {
    Name = var.vm_name
  }
}

resource "azurerm_virtual_machine_extension" "CustomScript" {
  name                 = "CustomScript"
  virtual_machine_id   = azurerm_linux_virtual_machine.vm.id
  publisher            = "Microsoft.Azure.Extensions"
  type                 = "CustomScript"
  type_handler_version = "2.1"

  settings = <<SETTINGS
  {
    "fileUris": [
      "https://raw.githubusercontent.com/mate-academy/devops_todolist_terraform_task/main/install-app.sh"
    ],
    "commandToExecute": "bash install-app.sh"
  }
SETTINGS

  depends_on = [azurerm_linux_virtual_machine.vm]
}