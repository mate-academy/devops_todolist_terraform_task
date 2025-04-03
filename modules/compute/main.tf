resource "azurerm_network_interface" "main" {
  name                = "${var.vm_name}-nic"
  location            = var.location
  resource_group_name = var.resource_group_name


  ip_configuration {
    name                          = "configuration1"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = var.public_ip_address_id
  }
}

resource "azurerm_linux_virtual_machine" "matebox" {
  name                = var.vm_name
  resource_group_name = var.resource_group_name
  location            = var.location
  size                = var.vm_size
  admin_username      = var.admin_username
  network_interface_ids = [
    azurerm_network_interface.main.id,
  ]

  admin_ssh_key {
    username   = var.admin_username
    public_key = file(var.ssh_key_public)
  }

  os_disk {
    name                 = "matedisc1"
    caching              = "ReadWrite"
    storage_account_type = var.os_disk_type
  }


  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = var.ubuntu_version
  }
}

resource "azurerm_virtual_machine_extension" "main" {
  name                       = "CustomScript"
  virtual_machine_id         = azurerm_linux_virtual_machine.matebox.id
  publisher                  = "Microsoft.Azure.Extensions"
  type                       = "CustomScript"
  type_handler_version       = "2.1"
  auto_upgrade_minor_version = true

  settings = jsonencode({
    fileUris         = ["https://raw.githubusercontent.com/Ramzes525/azure_task_12_deploy_app_with_vm_extention/main/install-app.sh"]
    commandToExecute = "chmod +x install-app.sh && ./install-app.sh"
  })

  tags = {
    environment = "Production"
  }
}
/*
resource "null_resource" "provision" {
  depends_on = [azurerm_linux_virtual_machine.main]

  provisioner "file" {
    source      = "./install-app.sh"
    destination = "/home/adminuser/install-app.sh"
  }

  provisioner "file" {
    source      = "./app"
    destination = "/home/adminuser/app"
  }

  provisioner "remote-exec" {
    connection {
      type        = "ssh"
      user        = "adminuser"
      private_key = file("~/.ssh/linuxboxsshkey.pem")
      host        = azurerm_public_ip.main.ip_address
    }

    inline = [
      "sudo apt-get update -y",
      "sudo chmod +x /home/adminuser/install-app.sh",
      "sudo bash /home/adminuser/install-app.sh"
    ]
  }
}
*/
