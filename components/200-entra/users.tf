# Create my administrator user
resource "azuread_user" "mervin16" {
  user_principal_name = "mervin16@${local.domain.plagueworks_org}"
  display_name        = "Mervin Hemaraju"
  mail_nickname       = "mervin16"
  password            = data.doppler_secrets.azure_crds.map.AZURE_APOLLO_AD_ADMIN_PASSWORD
  account_enabled     = true
}

# Add mervin16 to the Administrators group
resource "azuread_group_member" "mervin16_admin_member" {
  group_object_id  = azuread_group.administrators.object_id
  member_object_id = azuread_user.mervin16.object_id
}
