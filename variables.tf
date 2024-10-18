variable "alarm_actions" {
  type        = string
  default     = "[]"
  description = "List of actions. In JSON string format."
}

variable "alarm_action_match" {
  type        = string
  default     = "any"
  description = "Trigger actions when an event is captured by Sentry and `any` or `all` of the specified conditions happen."
}

variable "alarm_conditions" {
  type        = string
  default     = "[]"
  description = "List of conditions. In JSON string format."
}

variable "alarm_enabled" {
  type        = bool
  default     = true
  description = "Defines if alarms should be created"
}

variable "alarm_filters" {
  type        = string
  default     = null
  description = "A list of filters that determine if a rule fires after the necessary conditions have been met. In JSON string format."
}

variable "alarm_filter_match" {
  type        = string
  default     = null
  description = "A string determining which filters need to be true before any actions take place. Required when a value is provided for filters."
}

variable "alarm_frequency" {
  type        = number
  default     = 5
  description = "Perform actions at most once every X minutes for this issue."
}

variable "organization_slug" {
  type        = string
  description = "The unique URL slug for this organization."
  default     = "sentry"
}

variable "platform" {
  type        = string
  description = "The optional platform for this project."
  default     = "go"
}

variable "rate_limit_count" {
  type        = number
  description = "Number of events that can be reported within the rate limit window."
  default     = 100
}

variable "rate_limit_window" {
  type        = number
  description = "Length of time that will be considered when checking the rate limit."
  default     = 60
}

variable "resolve_age" {
  type        = number
  description = "Hours in which an issue is automatically resolve if not seen after this amount of time."
  default     = 720
}

variable "team_slug" {
  type        = string
  description = "The unique team slug."
  default     = "sentry"
}

variable "webhook_url" {
  type        = string
  default     = ""
  description = "Newline seperated list of URLs for the webhook plugin."
}
