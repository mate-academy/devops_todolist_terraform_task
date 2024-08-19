variable "strg_resource_group_name" {
  description = (
    <<EOF
      Required for input during module import
        suggests you have created resource group elsewhere
      EOF
  )
  type = string
}

variable "strg_location" {
  description = (
    <<EOF
      Required for input during module import
        suggests you have created resource group elsewhere
      EOF
  )
  type = string
}

variable "strg_account_name_prefix" {
  description = (
    <<EOF
      Optional for input during module import
        This module creates Storage Account Name in the following format:
        <strg_account_name_prefix>< 4 Random lowercase characters >< 4 random digits >

      Default value "storage"
      EOF
  )
  type    = string
  default = "storage"
  validation {
    condition = (
      length(var.strg_account_name_prefix) <= 16 &&
      can(regex("^[a-z]+$", var.strg_account_name_prefix))
    )
    error_message = (
      <<EOF
        The storage account prefix must be up to 16 characters in length &
        contain only lowercase characters.
      EOF
    )
  }
}

variable "strg_account_tier" {
  description = (
    <<EOF
      Optional for input during module import
        possible values are:
        - Standard
        - Premium
      Default value is Standard
      EOF
  )
  type    = string
  default = "Standard"
  validation {
    condition     = contains(["Standard", "Premium"], var.strg_account_tier)
    error_message = "The Storage account tier must be either 'Standard' or 'Premium'."
  }
}

variable "strg_account_access_tier" {
  description = (
    <<EOF
      Optional for input during module import
        possible values are:
        - "Hot"
        - "Cool"
        - ""  (if account kind is "Storage")
      Default value is "Hot"
      EOF
  )
  type    = string
  default = "Hot"
  validation {
    condition = (
      contains(["Hot", "Cool", ""], var.strg_account_access_tier)
    )
    error_message = "The Storage access tier must be 'Hot' or 'Cool', or an empty string for Storage (StorageV1) accounts."
  }
}

variable "strg_account_kind" {
  description = (
    <<EOF
      Optional for input during module import
        possible values are:
          - BlobStorage
          - BlockBlobStorage
          - FileStorage
          - Storage
          - StorageV2
      Default value is "StorageV2"
      EOF
  )
  type    = string
  default = "StorageV2"
  validation {
    condition = (
      contains([
        "BlobStorage", "BlockBlobStorage", "FileStorage",
        "Storage", "StorageV2"
      ], var.strg_account_kind) &&
      !(
        (var.strg_account_kind == "BlockBlobStorage" && var.strg_account_tier != "Premium") ||
        (var.strg_account_kind == "FileStorage" && var.strg_account_tier != "Premium") ||
        (var.strg_account_kind == "Storage" && var.strg_account_access_tier != "")
      )
    )
    error_message = (
      <<EOF
        The Storage account kind must be one of the following:
        - BlobStorage
        - BlockBlobStorage  - only supports Premium account_tier
        - FileStorage       - only supports Premium account_tier
        - Storage           - doesn't support access tier (make it "")
        - StorageV2
      EOF
    )
  }
}

variable "strg_account_replication_type" {
  description = (
    <<EOF
      Optional for input during module import
        possible values are:
          - LRS
          - GRS
          - RAGRS
          - ZRS
          - GZRS
          - RAGZRS
      Default value is "LRS"
      EOF
  )
  type    = string
  default = "LRS"
  validation {
    condition = (
      contains([
        "LRS", "GRS", "RAGRS",
        "ZRS", "GZRS", "RAGZRS"
      ], var.strg_account_replication_type)
    )
    error_message = (
      <<EOF
        The storage account replication type must be one of the following:
        - LRS
        - GRS
        - RAGRS
        - ZRS
        - GZRS
        - RAGZRS
      EOF
    )
  }
}

variable "strg_container_name" {
  description = (
    <<EOF
      Optional for input during module import

      Default value is "storage-container-1"
      EOF
  )
  type    = string
  default = "storage-container-1"
  validation {
    condition = (
      length(var.strg_container_name) >= 3 &&
      length(var.strg_container_name) <= 63 &&
      can(regex("^[a-z0-9]+(-[a-z0-9]+)*$", var.strg_container_name)) &&
      !can(regex("--", var.strg_container_name))
    )
    error_message = (
      <<EOF
        The storage container name must be between 3 and 63 characters long;
        can only contain lowercase letters, numbers, and hyphens `-`;
        cannot start or end with a hyphen `-`;
        hyphens cannot be consecutive;
        all letters must be lowercase.
      EOF
    )
  }
}

variable "strg_container_access_type" {
  description = (
    <<EOF
      Optional for input during module import
        possible values are:
          - blob
          - container
          - private
      Default value is "blob"
      EOF
  )
  type    = string
  default = "blob"
  validation {
    condition = (
      contains(["blob", "container", "private"], var.strg_container_access_type)
    )
    error_message = (
      <<EOF
        The storage container acess type must be one of the following:
        - blob
        - container
        - private
      EOF
    )
  }
}

variable "strg_blob_type" {
  description = (
    <<EOF
      Optional for input during module import
        possible values are:
          - Block
          - Page
          - Append
      Default value is "block"
      EOF
  )
  type    = string
  default = "Block"
  validation {
    condition = (
      contains([
        "Block", "Page", "Append"
    ], var.strg_blob_type))
    error_message = (
      <<EOF
        The storage blob type must be one of the following:
          - Block
          - Page
          - Append
      EOF
    )
  }
}

variable "strg_blob_name" {
  description = "Required for input during module import"
  type        = string
  validation {
    condition = (
      length(var.strg_blob_name) >= 1 && length(var.strg_blob_name) <= 1024 &&
      can(regex("^[a-zA-Z0-9]([a-zA-Z0-9-._]*[a-zA-Z0-9])?$", var.strg_blob_name)) &&
      !can(regex("(--|__|\\.{2,})", var.strg_blob_name))
    )
    error_message = (
      <<EOF
        The storage blob name must be 1-1024 characters long;
        start with a letter or number;
        contain only letters, numbers and hyphens;
        no "--", ".." or "__" allowed;
        end with a letter & number
      EOF
    )
  }
}

variable "strg_blob_source" {
  description = (
    <<EOF
      Required for input during module import
        supply an absolute path to a file on the local system
        to be uploaded to storage container
      EOF
  )
  type = string
}
