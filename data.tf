data "sentry_organization" "default" {
  slug = var.organization_slug
}

data "sentry_team" "default" {
  organization = data.sentry_organization.default.id
  slug         = var.team_slug
}

data "sentry_key" "default" {
  organization = sentry_project.default.organization
  project      = sentry_project.default.id

  first = true
}
