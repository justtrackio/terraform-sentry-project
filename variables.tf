variable "base_url" {
  type        = string
  description = "The target Sentry Base API URL in the format https://[hostname]/api/. The default value is https://sentry.io/api/. The value must be provided when working with Sentry On-Premise."
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

variable "token" {
  type        = string
  description = "The authentication token used to connect to Sentry."
}
