
### needed by ecs service submodule ###

output "task_definition_arn" {
  value       = aws_ecs_task_definition.app.arn
  description = " ARN of the ECS task definition used by the ECS service to run container tasks."
}
