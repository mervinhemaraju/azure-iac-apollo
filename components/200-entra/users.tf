resource "azuread_user" "mervinhemaraju16" {
  user_principal_name = "mervinhemaraju16@gmail.com"
  display_name        = "Mervin Hemaraju"
  mail_nickname       = "mervinhemaraju16"
  password            = data.doppler_secrets.azure_crds.map.AZURE_APOLLO_AD_ADMIN_PASSWORD
}
