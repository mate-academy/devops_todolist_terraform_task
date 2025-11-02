resource "azurerm_network_interface" "example" {
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

resource "azurerm_linux_virtual_machine" "vm" {
  name                            = var.vm_name
  location                        = var.location
  resource_group_name             = var.resource_group_name
  network_interface_ids           = [azurerm_network_interface.example.id]
  size                            = var.vm_size
  admin_username                  = "azureuser"
  disable_password_authentication = true

 admin_ssh_key {
    username   = "azureuser"
    public_key = azurerm_ssh_public_key.example.public_key_openssh
  }


  os_disk {
    name                 = "${var.vm_name}-osdisk"
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22.04-LTS"
    version   = "latest"
  }
}

resource "azurerm_ssh_public_key" "example" {
  name                = "linuxboxsshkey"
  resource_group_name = var.resource_group_name
  location            = var.location
  public_key          = var.ssh_key_public
}


resource "azurerm_virtual_machine_extension" "example" {
  name                 = "hostname"
  virtual_machine_id   = azurerm_linux_virtual_machine.vm.id
  publisher            = "Microsoft.Azure.Extensions"
  type                 = "CustomScript"
  type_handler_version = "2.0"

  settings = <<SETTINGS
 {
  "fileUris": ["https://raw.githubusercontent.com/Vitalii-devops/azure_task_12_deploy_app_with_vm_extention/refs/heads/main/install-app.sh"],
      "commandToExecute": "bash install-app.sh"
 }
SETTINGS
}