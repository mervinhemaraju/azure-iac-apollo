# Time rotating
resource "time_rotating" "cloudflare_zta" {
  rotation_days = 180
}

# The cloudflare application
resource "azuread_application" "cloudflare_zta" {
  display_name = "cloudflare-zta"
  #   logo_image       = filebase64("/path/to/logo.png")
  sign_in_audience = "AzureADMyOrg"

  feature_tags {
    enterprise = true
    gallery    = true
  }

  optional_claims {
    id_token {
      name                  = "email"
      source                = null
      essential             = false
      additional_properties = []
    }

    id_token {
      name                  = "given_name"
      source                = null
      essential             = false
      additional_properties = []
    }

    id_token {
      name                  = "family_name"
      source                = null
      essential             = false
      additional_properties = []
    }
  }

  required_resource_access {
    resource_app_id = data.azuread_service_principal.microsoft_graph.client_id

    # Directory.Read.All - Read directory data
    resource_access {
      id   = local.graph_permissions.directory_read_all
      type = "Role"
    }

    # email - View users' email address
    resource_access {
      id   = local.graph_permissions.email
      type = "Scope"
    }

    # GroupMember.Read.All - Read group memberships
    resource_access {
      id   = local.graph_permissions.group_member_read_all
      type = "Role"
    }

    # offline_access - Maintain access to data you have given it access to
    resource_access {
      id   = local.graph_permissions.offline_access
      type = "Scope"
    }

    # openid - Sign users in
    resource_access {
      id   = local.graph_permissions.openid
      type = "Scope"
    }

    # profile - View users' basic profile
    resource_access {
      id   = local.graph_permissions.profile
      type = "Scope"
    }

    # User.Read - Sign in and read user profile
    resource_access {
      id   = local.graph_permissions.user_read
      type = "Scope"
    }
  }

  web {
    # homepage_url  = "https://app.example.net"
    # logout_url    = "https://app.example.net/logout"
    redirect_uris = ["https://${data.doppler_secrets.cloudflare_creds.map.ZTA_DOMAIN_NAME}/cdn-cgi/access/callback"]

    implicit_grant {
      access_token_issuance_enabled = false
      id_token_issuance_enabled     = true
    }
  }

  password {
    display_name = "cf-zta-secret"
    start_date   = time_rotating.cloudflare_zta.id
    end_date     = timeadd(time_rotating.cloudflare_zta.id, "525600h") # 60 years
  }
}

# The service principal
resource "azuread_service_principal" "cloudflare_zta" {
  client_id = azuread_application.cloudflare_zta.client_id
}

# Grant admin consent for application permissions
resource "azuread_app_role_assignment" "directory_read_all" {
  app_role_id         = local.graph_permissions.directory_read_all
  principal_object_id = azuread_service_principal.cloudflare_zta.object_id
  resource_object_id  = data.azuread_service_principal.microsoft_graph.object_id
}

resource "azuread_app_role_assignment" "group_read_all" {
  app_role_id         = local.graph_permissions.group_member_read_all
  principal_object_id = azuread_service_principal.cloudflare_zta.object_id
  resource_object_id  = data.azuread_service_principal.microsoft_graph.object_id
}
