

variable "cluster_id" {
  type        = string
  description = "ID of the ECS cluster where the ECS service will run."
} #module


variable "ecs_task_definition_arn" {
  type        = string
  description = "ARN of the ECS task definition used by the ECS service to launch tasks."
} #module


variable "desired_task_count" {
  type        = number
  description = "Number of ECS tasks the service should maintain and run."
}

variable "private_subnet_ids" {
  type        = list(string)
  description = "List of private subnet IDs where the ECS tasks will be deployed."
} #module


variable "container_port" {
  type        = number
  description = "Port on which the application container listens for incoming traffic."
}

variable "target_group_arn" {
  type        = string
  description = "ARN of the load balancer target group that the ECS service will register tasks with."
} #module



variable "security_groups" {
  type        = list(string)
  description = "List of security group IDs to associate with the resource"
}



variable "container_name" {
  type        = string
  description = "Name of the container defined inside the ECS task definition"
}
