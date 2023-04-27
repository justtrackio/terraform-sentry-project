output "dsn" {
  description = "DSN for the key"
  value       = data.sentry_key.default.dsn_public
}
