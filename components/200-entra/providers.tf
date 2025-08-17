# Azure AD Provider
provider "azuread" {
}

data "azuread_domains" "default" {
  only_default = true
}

# Doppler Provider for Secrets Manager
provider "doppler" {
  doppler_token = var.token_doppler_global
}
