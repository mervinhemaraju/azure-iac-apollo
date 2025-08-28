# User mervin16 and its role assignment
resource "azuread_user" "mervin16" {
  user_principal_name = "mervin16@${local.domains.plagueworks_org}"
  display_name        = "Mervin Hemaraju"
  mail_nickname       = "mervin16"
  password            = data.doppler_secrets.azure_crds.map.AZURE_APOLLO_AD_ADMIN_PASSWORD
  account_enabled     = true
}

resource "azuread_directory_role_assignment" "mervin16_global_admin" {
  role_id             = data.azuread_directory_role.global_administrator.template_id
  principal_object_id = azuread_user.mervin16.object_id
}
