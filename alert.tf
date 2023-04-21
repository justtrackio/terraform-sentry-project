resource "sentry_issue_alert" "default" {
  organization = sentry_project.default.organization
  project      = sentry_project.default.id
  name         = sentry_project.default.name

  action_match = "any"
  filter_match = "any"
  frequency    = 30

  conditions = [
    {
      id             = "sentry.rules.conditions.event_frequency.EventFrequencyCondition"
      name           = "The issue is seen more than 200 times in 1h"
      value          = 200
      comparisonType = "count"
      interval       = "1h"
    },
    {
      id             = "sentry.rules.conditions.event_frequency.EventUniqueUserFrequencyCondition"
      name           = "The issue is seen by more than 100 users in 1h"
      value          = 100
      comparisonType = "count"
      interval       = "1h"
    },
    {
      id             = "sentry.rules.conditions.event_frequency.EventFrequencyPercentCondition"
      name           = "The issue affects more than 50.0 percent of sessions in 1h"
      value          = 50.0
      comparisonType = "count"
      interval       = "1h"
    },
  ]

  filters = [
    {
      id              = "sentry.rules.filters.age_comparison.AgeComparisonFilter"
      name            = "The issue is older than 10 minute"
      value           = 10
      time            = "minute"
      comparison_type = "older"
    },
    {
      id    = "sentry.rules.filters.issue_occurrences.IssueOccurrencesFilter"
      name  = "The issue has happened at least 10 times"
      value = 10
    },
    {
      id               = "sentry.rules.filters.assigned_to.AssignedToFilter"
      name             = "The issue is assigned to Team"
      targetType       = "Team"
      targetIdentifier = sentry_team.default.team_id
    },
    {
      id   = "sentry.rules.filters.latest_release.LatestReleaseFilter"
      name = "The event is from the latest release"
    },
    {
      id    = "sentry.rules.filters.level.LevelFilter"
      name  = "The event's level is equal to fatal"
      match = "eq"
      level = "50"
    }
  ]

  actions = [
    {
      id   = "sentry.rules.actions.notify_event.NotifyEventAction"
      name = "Send a notification (for all legacy integrations)"
    }
  ]
}

resource "sentry_metric_alert" "default" {
  organization      = sentry_project.default.organization
  project           = sentry_project.default.id
  name              = sentry_project.default.name
  dataset           = "events"
  query             = ""
  aggregate         = "count()"
  time_window       = 60
  threshold_type    = 0
  resolve_threshold = 0

  trigger {
    action {
      type              = "email"
      target_type       = "team"
      target_identifier = sentry_team.default.team_id
    }
    alert_threshold = 300
    label           = "critical"
    threshold_type  = 0
  }

  trigger {
    alert_threshold = 100
    label           = "warning"
    threshold_type  = 0
  }
}
