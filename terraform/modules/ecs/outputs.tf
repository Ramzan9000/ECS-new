### needed by ecs service submodule ###

output "cluster_id" {
  value       = aws_ecs_cluster.main.id
  description = "ID of the ECS cluster where services and tasks are deployed."
}


output "task_definition_arn" {
  value       = module.task_definition.task_definition_arn
  description = " ARN of the ECS task definition used by the ECS service to run container tasks."
}
