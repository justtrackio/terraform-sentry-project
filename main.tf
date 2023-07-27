resource "sentry_project" "default" {
  organization = data.sentry_organization.default.id

  teams = [data.sentry_team.default.id]
  name  = module.this.id
  slug  = module.this.id

  platform    = var.platform
  resolve_age = var.resolve_age
}

resource "sentry_key" "default" {
  organization = data.sentry_organization.default.id

  project = sentry_project.default.name
  name    = sentry_project.default.name

  rate_limit_count  = var.rate_limit_count
  rate_limit_window = var.rate_limit_window
}
