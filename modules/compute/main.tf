resource "azurerm_network_interface" "main" {
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

resource "azurerm_virtual_machine" "main" {
  name                = var.vm_name
  location            = var.location
  resource_group_name = var.resource_group_name
  network_interface_ids = [
    azurerm_network_interface.main.id
  ]
  vm_size = var.vm_size





  # Uncomment this line to delete the OS disk automatically when deleting the VM
  # delete_os_disk_on_termination = true

  # Uncomment this line to delete the data disks automatically when deleting the VM
  # delete_data_disks_on_termination = true

  storage_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }

  storage_os_disk {
    name              = "myosdisk1"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }

  os_profile {
    computer_name  = "hostname"
    admin_username = "testadmin"
  }

  os_profile_linux_config {
  disable_password_authentication = true
  ssh_keys {
    key_data = var.ssh_key_public
    path     = "/home/testadmin/.ssh/authorized_keys"
  }
}

  tags = {
    environment = "staging"
  }
}

resource "azurerm_virtual_machine_extension" "main" {
  name               = "install-app"
  virtual_machine_id = azurerm_virtual_machine.main.id

  publisher            = "Microsoft.Azure.Extensions"
  type                 = "CustomScript"
  type_handler_version = "2.1"

  settings = jsonencode({
    fileUris = [
      var.script_blob_url
    ]

    commandToExecute = "sudo bash install-app.sh"
  })
}



resource "azurerm_network_interface_security_group_association" "example" {
  network_interface_id      = azurerm_network_interface.main.id
  network_security_group_id = var.network_security_group_id
}

