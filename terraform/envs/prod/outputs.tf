output "vpc_id" {
  value       = module.vpc.vpc_id
  description = "ID of the VPC."
}

output "public_subnet_ids" {
  value       = module.vpc.public_subnet_ids
  description = "List of public subnet IDs."
}

output "private_subnet_ids" {
  value       = module.vpc.private_subnet_ids
  description = "List of private subnet IDs."
}

output "alb_dns_name" {
  value       = module.alb.aws_alb_dns_name
  description = "DNS name of the Application Load Balancer."
}

output "target_group_arn" {
  value       = module.alb.target_group_arn
  description = "ARN of the Application Load Balancer target group."
}

output "certificate_arn" {
  value       = module.acm.certificate_arn
  description = "ARN of the ACM certificate used for HTTPS."
}

output "cluster_id" {
  value       = module.ecs.cluster_id
  description = "ID of the ECS cluster."
}

output "task_definition_arn" {
  value       = module.ecs.task_definition_arn
  description = "ARN of the ECS task definition."
}



output "ecr_repository_url" {
  value       = module.ecr.ecr_repository_url
  description = "ecr repo url "
}
