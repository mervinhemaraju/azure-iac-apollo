# The azure ad client config
data "azuread_client_config" "current" {}

# Doppler secrets for azure
data "doppler_secrets" "azure_crds" {
  project = "cloud-azure-creds"
}

# Get azure ad root domains
data "azuread_domains" "root" {
  only_root = true
}

# Get the Global Administrator role
data "azuread_directory_role" "global_administrator" {
  display_name = "Global Administrator"
}
