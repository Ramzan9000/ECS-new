

### ECS cluster made for service ###

resource "aws_ecs_cluster" "main" {
  name = "app-cluster"
}

### task_definition submodule ###

module "task_definition" {
  source = "./submodules/task_definition"

  family          = var.family
  use_placeholder = var.use_placeholder
  real_image      = var.real_image
  container_name  = var.container_name
  container_port  = var.container_port
  task_cpu        = var.task_cpu
  task_memory     = var.task_memory
  execution_role_arn = var.execution_role_arn
  region          = var.region
}


### service submodule ###

module "service" {
  source = "./submodules/service"

  cluster_id = aws_ecs_cluster.main.id
  ecs_task_definition_arn = module.task_definition.task_definition_arn
  desired_task_count      = var.desired_task_count
  private_subnet_ids      = var.private_subnet_ids #module
  container_port          = var.container_port 
  container_name          = var.container_name
  target_group_arn        = var.target_group_arn #module
  security_groups         = var.security_groups #module
  
}

