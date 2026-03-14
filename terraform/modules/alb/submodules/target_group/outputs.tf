### needed for ecs service submodule and alb listener ###

output "target_group_arn" {
  value = aws_lb_target_group.alb_tg.arn
  description = " ARN of the Application Load Balancer target group used to route traffic to ECS tasks"
}