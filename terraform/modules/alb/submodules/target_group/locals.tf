locals {
  healthcheck_path = var.use_placeholder ? "/" : "/health"
}