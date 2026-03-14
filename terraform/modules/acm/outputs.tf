
### needed for alb listener submodule ###

output "certificate_arn" {
  value       = aws_acm_certificate_validation.acm.certificate_arn
  description = "ARN of the ACM certificate used for TLS/HTTPS on the load balancer"
}