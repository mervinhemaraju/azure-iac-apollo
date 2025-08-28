# Azure AD Provider
provider "azuread" {}

# Doppler Provider for Secrets Manager
provider "doppler" {
  doppler_token = var.token_doppler_global
}
