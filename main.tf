resource "sentry_team" "default" {
  organization = data.sentry_organization.default.id

  name = module.this.id
}

resource "sentry_project" "default" {
  organization = sentry_team.default.organization

  teams = [sentry_team.default.name]
  name  = module.this.id

  platform    = var.platform
  resolve_age = var.resolve_age
}
