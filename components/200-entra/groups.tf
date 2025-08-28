# Create the Administrators group
resource "azuread_group" "administrators" {
  display_name            = "Administrators"
  description             = "Global Administrators group with MFA enforcement"
  security_enabled        = true
  prevent_duplicate_names = true
  assignable_to_role      = true
}

# Assign Global Administrator role to the group
resource "azuread_directory_role_assignment" "administrators_global_admin" {
  role_id             = azuread_directory_role.global_administrator.template_id
  principal_object_id = azuread_group.administrators.object_id
}
