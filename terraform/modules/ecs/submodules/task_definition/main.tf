
### resource for cloudwatch logs to add container logs to ###

resource "aws_cloudwatch_log_group" "app" {
  name = "/ecs/app"
}


resource "aws_ecs_task_definition" "app" {
  family                   = var.family
  requires_compatibilities = ["FARGATE"]
  network_mode             = "awsvpc"
  cpu                      = var.task_cpu
  memory                   = var.task_memory
  execution_role_arn       = var.execution_role_arn # make this var anf get from iam output usisng root main.tf 

  container_definitions = jsonencode([
    {
      name      = var.container_name
      image     = local.container_image
      essential = true

      portMappings = [
        {
          containerPort = var.container_port
        }
      ]

      logConfiguration = {
        logDriver = "awslogs"
        options = {
          awslogs-group         = aws_cloudwatch_log_group.app.name
          awslogs-region        = var.region
          awslogs-stream-prefix = "ecs"
        }
      }
    }
  ])
}