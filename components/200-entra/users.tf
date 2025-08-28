# resource "azuread_user" "mervinhemaraju" {
#   user_principal_name = "mervinhemaraju@${data.azuread_domains.default.domains.0.domain_name}"
#   display_name        = "Mervin Hemaraju"
#   mail_nickname       = "mervinhemaraju"
#   password            = data.doppler_secrets.azure_crds.map.AZURE_APOLLO_AD_ADMIN_PASSWORD
#   account_enabled     = true
# }
