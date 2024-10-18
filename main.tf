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

resource "sentry_plugin" "webhook" {
  organization = data.sentry_organization.default.id

  project = sentry_project.default.name
  plugin  = "webhooks"

  config = {
    urls = var.webhook_url
  }
}

resource "sentry_issue_alert" "default" {
  count = var.alarm_enabled ? 1 : 0

  organization = data.sentry_organization.default.id
  project      = sentry_project.default.id
  name         = "Keep Alert Rule - ${sentry_project.default.name}"

  actions      = var.alarm_actions
  action_match = var.alarm_action_match
  conditions   = var.alarm_conditions
  filters      = var.alarm_filters
  filter_match = var.alarm_filter_match
  frequency    = var.alarm_frequency
}
