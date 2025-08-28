# Enable authentication methods for the user
resource "azuread_authentication_strength_policy" "require_mfa" {
  display_name = "Require MFA for Admin Users"
  description  = "Requires MFA for administrative users"

  allowed_combinations = [
    # "password",
    "password,hardwareOath",
    "password,microsoftAuthenticatorPush",
    "password,sms",
    "password,softwareOath",
    "password,voice",
  ]
}
