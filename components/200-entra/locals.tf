
locals {

  domains = {

    plaguework_org = [for domain in data.azuread_domains.root.domains : domain if domain.domain_name == "plagueworks.org"][0]
  }
}
