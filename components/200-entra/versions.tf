# The Terraform Module
terraform {

  # Azure Provider
  required_providers {
    azuread = {
      source  = "hashicorp/azuread"
      version = "~> 3.1.0"
    }
  }
}
