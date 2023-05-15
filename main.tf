resource "sentry_project" "default" {
  organization = data.sentry_organization.default.id

  teams = [data.sentry_team.default.id]
  name  = module.this.id

  platform    = var.platform
  resolve_age = var.resolve_age
}
