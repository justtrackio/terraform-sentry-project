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

variable "resolve_age" {
  type        = number
  description = "Hours in which an issue is automatically resolve if not seen after this amount of time."
  default     = 720
}

variable "token" {
  type        = string
  description = "The authentication token used to connect to Sentry."
}
