# 1. Network Interface (NIC) - name: ${var.vm_name}-nic
resource "azurerm_network_interface" "nic" {
  name                = "${var.vm_name}-nic"
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = "ipconfig"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = var.public_ip_id
  }
}

# Attach NSG to the NIC
resource "azurerm_network_interface_security_group_association" "nsg_attach" {
  network_interface_id      = azurerm_network_interface.nic.id
  network_security_group_id = var.nsg_id
}

# 2. Virtual Machine (VM) - name: matebox, size: Standard_B1s, image: Ubuntu
resource "azurerm_linux_virtual_machine" "vm" {
  name                  = var.vm_name
  location              = var.location
  resource_group_name   = var.resource_group_name
  size                  = var.vm_size
  network_interface_ids = [azurerm_network_interface.nic.id]

  # Using Ubuntu 20.04 LTS (stable choice for extensions)
  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy" # Offer for Ubuntu 22.04
    sku       = "22_04-lts"
    version   = "latest"
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  admin_username                  = var.admin_username
  disable_password_authentication = true

  admin_ssh_key {
    username   = var.admin_username
    public_key = var.ssh_key_public # linuxboxsshkey
  }
}

# 3. Upload install-app.sh to Storage Blob
# The CustomScript extension requires a URI to download the file.
resource "azurerm_storage_blob" "app_script" {
  name                   = "install-app.sh"
  storage_account_name   = var.storage_account_name
  storage_container_name = var.storage_container_name
  type                   = "Block"
  source                 = var.script_path # Path to local install-app.sh
  content_type           = "text/plain"
}

# 4. VM Extension (CustomScript) to execute install-app.sh
resource "azurerm_virtual_machine_extension" "custom_script_deploy" {
  name                       = "custom-script-deploy"
  virtual_machine_id         = azurerm_linux_virtual_machine.vm.id
  publisher                  = "Microsoft.Azure.Extensions"
  type                       = "CustomScript"
  type_handler_version       = "2.1"
  auto_upgrade_minor_version = true

  # The CustomScript settings: defines the file to download and the command to run.
  settings = jsonencode({
    fileUris = [
      "${azurerm_storage_blob.app_script.url}" # Direct URL to the uploaded blob
    ]
    commandToExecute = "chmod +x install-app.sh && ./install-app.sh"
  })

  # Ensure the blob is uploaded before the extension runs
  depends_on = [azurerm_storage_blob.app_script]
}