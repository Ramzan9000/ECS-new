
### http listener on port 80 that redirects traffic to https on port 443 ###
resource "aws_lb_listener" "http_traffic" {
  load_balancer_arn = var.load_balancer_arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type = "redirect"

    redirect {
      port        = "443"
      protocol    = "HTTPS"
      status_code = "HTTP_301"
    }
  }
}


### https listener with that forwards traffic to target group ###

resource "aws_lb_listener" "front_end" {
  load_balancer_arn = var.load_balancer_arn
  port              = 443
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-2016-08"
  certificate_arn   = var.certificate_arn

  default_action {
    type             = "forward"
    target_group_arn = var.target_group_arn
  }
}