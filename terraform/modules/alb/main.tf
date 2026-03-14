### making the alb resource ###

resource "aws_lb" "dev" {
  name               = "dev-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [var.alb_security_group_id] 
  subnets            = var.public_subnet_ids
  enable_deletion_protection = false

  tags = {
    Environment = "dev"
  }
}





### listener ###

module "listener" {
  source = "./submodules/listener"
  load_balancer_arn = aws_lb.dev.arn
  target_group_arn  = module.target_group.target_group_arn
  certificate_arn   = var.certificate_arn
}


### target_group ###

module "target_group" {
  source = "./submodules/target_group"
  app_container_port = var.app_container_port
  vpc_id = var.vpc_id
  use_placeholder = var.use_placeholder

}