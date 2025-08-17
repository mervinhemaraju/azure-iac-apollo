data "azuread_client_config" "current" {}

data "doppler_secrets" "azure_crds" {
  project = "cloud-azure-creds"
}
