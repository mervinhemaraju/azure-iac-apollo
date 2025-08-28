
locals {
  domain = {
    plagueworks_org = [for domain in data.azuread_domains.root.domains : domain if domain.domain_name == "plagueworks.org"][0]["domain_name"]
  }

  graph_permissions = {
    directory_read_all    = "7ab1d382-f21e-4acd-a863-ba3e13f7da61"
    email                 = "64a6cdd6-aab1-4aaf-94b8-3cc8405e90d0"
    group_member_read_all = "bc024368-1153-4739-b217-4326f2e966d0"
    offline_access        = "7427e0e9-2fba-42fe-b0c0-848c9e6a8182"
    openid                = "37f7f235-527c-4136-accd-4a02d197296e"
    profile               = "14dad69e-099b-42c9-810b-d002981feec1"
    user_read             = "e1fe6dd8-ba31-4d61-89e7-88639da4683d"
  }
}
