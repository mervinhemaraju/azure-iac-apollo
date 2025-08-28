# Conditional Access Policy for MFA - targeting the Administrators group
resource "azuread_conditional_access_policy" "mfa_for_admin_group" {
  display_name = "Require MFA for Administrators Group"
  state        = "enabled"

  conditions {
    client_app_types = ["all"]

    users {
      # Target the administrators group
      included_groups = [azuread_group.administrators.object_id]
    }

    applications {
      included_applications = ["All"]
    }

    # Optional: Add location conditions
    locations {
      included_locations = ["All"]
      # excluded_locations = ["AllTrusted"]  # Exclude trusted locations if configured
    }
  }

  grant_controls {
    operator          = "OR"
    built_in_controls = ["mfa"]
  }
}
