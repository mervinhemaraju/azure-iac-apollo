
# Store cloudflare-zta the secret information in Doppler secrets
resource "doppler_secret" "cloudflare_zta_config" {
  project    = local.secrets.azure
  config     = "prd"
  name       = "AZURE_APOLLO_APPS_CLOUDFLARE_ZTA_CONFIG"
  value_type = "json"
  value = jsonencode(
    {
      "application_id" : azuread_application.cloudflare_zta.client_id
      "secret" : tolist(azuread_application.cloudflare_zta.password).0.value
    }
  )
}
