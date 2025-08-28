
output "test" {
  value = jsonencode(data.azuread_domains.root.domains)
}
