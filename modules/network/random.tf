terraform {
  required_providers {
    random = {
      source = "hashicorp/random"
    }
  }
}

resource "random_integer" "dns" {
  min = 10000
  max = 99999
}
