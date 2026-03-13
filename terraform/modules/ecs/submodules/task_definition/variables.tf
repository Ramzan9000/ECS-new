


variable "use_placeholder" {
  type        = bool
  description = "Whether to run a placeholder container image (nginx) instead of the real application image."
}

variable "real_image" {
  type        = string
  description = "Docker image URI for the real application container stored in ECR."
}


variable "family" {
  type        = string
  description = "Name of the ECS task definition family."
}

variable "container_name" {
  type        = string
  description = "Name of the container defined inside the ECS task definition."
}


variable "container_port" {
  type = number
  description = "port app container is on"
}


variable "task_cpu" {
  type = number
  description = " cpu units per ecs task "
}


variable "task_memory" {
  type = number 
  description = " memory per ecs task"
}



variable "execution_role_arn" {
  type = string
  description = " ARN of the IAM execution role used by ECS tasks to pull images and write logs."
}



variable "region" {
  type = string
  description = "AWS region of deployment"
}
