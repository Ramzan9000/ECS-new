
### needed for ecs service submodule ###

output "target_group_arn" {
  value = module.target_group.target_group_arn
  description = "ARN of the Application Load Balancer target group used to route traffic to ECS tasks"
}


### needed for route53 module ###

output "aws_alb_dns_name" {
  value = aws_lb.dev.dns_name
  description = "The DNS name assigned by AWS to the Application Load Balancer. This is the endpoint that Route53 alias records point to"
}


output "aws_alb_zone_id" {
  value = aws_lb.dev.zone_id
  description = "The Route53 hosted zone ID associated with the Application Load Balancer, used when creating alias DNS records"
}
