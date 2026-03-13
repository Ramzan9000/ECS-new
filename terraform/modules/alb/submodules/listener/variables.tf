
variable "load_balancer_arn" {
  type = string
  description = "ARN of the Application Load Balancer that will receive incoming traffic."
}


variable "target_group_arn" {
  type = string
  description = "ARN of the load balancer target group where ECS tasks will be registered."
}


variable "certificate_arn" {
  type = string
  description = "ARN of the ACM SSL/TLS certificate used by the load balancer for HTTPS."
}
