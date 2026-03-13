
### needed for alb module ###

output "alb_sg_id" {
  value = aws_security_group.alb_sg.id
  description = "ID of the security group attached to the Application Load Balancer."
}


output "ecs_security_group_id" {
  value = aws_security_group.ecs_sg.id
  description = "ID of the security group attached to ECS tasks or services."
}