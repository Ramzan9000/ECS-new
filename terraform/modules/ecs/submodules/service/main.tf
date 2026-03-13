


### making service ###

resource "aws_ecs_service" "app" {
  name            = "app-service"
  cluster         = var.cluster_id 
  task_definition = var.ecs_task_definition_arn ### say as var and get task defieniton arn from module main.tf after task oupits it in output.tf of its submodule
  desired_count   = var.desired_task_count
  launch_type     = "FARGATE"

  network_configuration {
    subnets          = var.private_subnet_ids
    security_groups  = var.security_groups
    assign_public_ip = false
  }

  load_balancer {
    target_group_arn = var.target_group_arn 
    container_name   = "app"
    container_port   = var.container_port
  }
}