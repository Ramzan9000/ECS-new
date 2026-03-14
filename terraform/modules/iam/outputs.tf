
### needed by ecs task_definition submodule ###

output "execution_role_arn" {
  value       = aws_iam_role.ecs_execution_r.arn
  description = "ARN of the IAM execution role used by ECS tasks to pull container images and send logs to CloudWatch."
}