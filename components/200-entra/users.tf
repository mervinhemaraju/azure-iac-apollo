# User mervin16 and its role assignment
resource "azuread_user" "mervin16" {
  user_principal_name = "mervin16@${local.domain.plagueworks_org}"
  display_name        = "Mervin Hemaraju"
  mail_nickname       = "mervin16"
  password            = data.doppler_secrets.azure_crds.map.AZURE_APOLLO_AD_ADMIN_PASSWORD
  account_enabled     = true
}

resource "azuread_directory_role_assignment" "mervin16_global_admin" {
  role_id             = azuread_directory_role.global_administrator.template_id
  principal_object_id = azuread_user.mervin16.object_id
}

# Enable authentication methods for the user
resource "azuread_authentication_strength_policy" "require_mfa" {
  display_name = "Require MFA for Admin Users"
  description  = "Requires MFA for administrative users"

  allowed_combinations = [
    "password,microsoftAuthenticator",
    "password,sms",
    "password,softwareOath",
  ]
}
