terraform {
  required_providers {
    random = {
      source = "hashicorp/random"
    }
  }
}

resource "random_integer" "strg_name" {
  min = 0
  max = 9999
}

resource "random_string" "strg_name" {
  length  = 4
  lower   = true
  upper   = false
  special = false
  numeric = false
}
