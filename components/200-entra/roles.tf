# Activate the global adminsitrator role
resource "azuread_directory_role" "global_administrator" {
  display_name = "Global Administrator"
}
