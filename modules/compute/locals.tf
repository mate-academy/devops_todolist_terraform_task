locals {
  nic_name = "${var.comp_vm_name}-nic"
}

locals {
  # Extract the filename from the URL using replace
  script_filename = replace(var.comp_custom_script_url, ".*\\/", "")
}
