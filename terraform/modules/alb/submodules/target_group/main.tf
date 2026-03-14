
resource "aws_lb_target_group" "alb_tg" {
  name        = "tf-alb-tg"
  target_type = "ip" # because were using fargate which means we use awsvpc as our network mode and ecs tasks in awsvpc are "ip targets"
  port        = var.app_container_port # port our app container listens on 
  protocol    = "HTTP"
  vpc_id      = var.vpc_id 



  health_check {
    enabled             = true
    path                = local.healthcheck_path
    protocol            = "HTTP"
    matcher             = "200"
    healthy_threshold   = 2
    unhealthy_threshold = 2
    interval            = 30
    timeout             = 5
  }
  
}