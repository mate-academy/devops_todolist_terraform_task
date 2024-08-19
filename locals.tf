locals {
  custom_script_url = "https://${module.storage_module.strg_account.name}.blob.core.windows.net/${module.storage_module.strg_container.name}/${var.blob_name}"
  sensitive         = true
}
