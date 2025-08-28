# The azure ad client config
data "azuread_client_config" "current" {}

# Doppler secrets for azure
data "doppler_secrets" "azure_creds" {
  project = "cloud-azure-creds"
}

# Doppler secrets for cloudflare
data "doppler_secrets" "cloudflare_creds" {
  project = "cloudflare-creds"
}

# Get azure ad root domains
data "azuread_domains" "root" {
  only_root = true
}

# Azure service principal for microsoft graph
data "azuread_service_principal" "microsoft_graph" {
  display_name = "Microsoft Graph"
}
