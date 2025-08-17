# The Terraform Module
terraform {

  # Azure Provider
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.1.0"
    }
  }
}
