
### alb sg ###

resource "aws_security_group" "alb_sg" {
  name        = "alb_security_group"
  description = "Allow TLS inbound traffic and all outbound traffic"
  vpc_id      = var.vpc_id

  tags = {
    Name = "alb_sg"
  }
}

### inbound rules for http traffic on any ipv4 or ipv6 address ###

resource "aws_vpc_security_group_ingress_rule" "http-allow_tls_ipv4" {
  security_group_id = aws_security_group.alb_sg.id
  cidr_ipv4         = var.cidr_ipv4
  from_port         = 80
  ip_protocol       = "tcp"
  to_port           = 80
}

resource "aws_vpc_security_group_ingress_rule" "http-allow_tls_ipv6" {
  security_group_id = aws_security_group.alb_sg.id
  cidr_ipv6         = var.cidr_ipv6
  from_port         = 80
  ip_protocol       = "tcp"
  to_port           = 80
}


### inbound rules for https traffic on any ipv6 or ipv6 address ###

resource "aws_vpc_security_group_ingress_rule" "https-allow_tls_ipv4" {
  security_group_id = aws_security_group.alb_sg.id
  cidr_ipv4         = var.cidr_ipv4
  from_port         = 443
  ip_protocol       = "tcp"
  to_port           = 443
}

resource "aws_vpc_security_group_ingress_rule" "https-allow_tls_ipv6" {
  security_group_id = aws_security_group.alb_sg.id
  cidr_ipv6         = var.cidr_ipv6
  from_port         = 443
  ip_protocol       = "tcp"
  to_port           = 443
}


### outbound rules to allow all outbound traffic to any ipv4 or ipv6 address ###

resource "aws_vpc_security_group_egress_rule" "alb-allow_all_traffic_ipv4" {
  security_group_id = aws_security_group.alb_sg.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}


resource "aws_vpc_security_group_egress_rule" "alb-allow_all_traffic_ipv6" {
  security_group_id = aws_security_group.alb_sg.id
  cidr_ipv6         = "::/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}



### ecs task sg ####


resource "aws_security_group" "ecs_sg" {
  name        = "ecs_task_sg"
  description = "sg for ecs with inbund rules to reviece traffic from alb_sg"
  vpc_id      = var.vpc_id

  tags = {
    Name = "ecs_task_sg"
  }
}


### inbound rule for ecs_task sg to recieve traffic from alb_sg ####


resource "aws_vpc_security_group_ingress_rule" "alb_traffic" {
  security_group_id = aws_security_group.ecs_sg.id
  referenced_security_group_id = aws_security_group.alb_sg.id
  from_port         = var.app_container_port # port where app container listens 
  ip_protocol       = "tcp"
  to_port           = var.app_container_port

}

### outbound rules for ecs_task_sg to allow all ipv4 and ipv6 traffic  ####


resource "aws_vpc_security_group_egress_rule" "ecs-allow_all_traffic_ipv4" {
  security_group_id = aws_security_group.ecs_sg.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}


resource "aws_vpc_security_group_egress_rule" "ecs-allow_all_traffic_ipv6" {
  security_group_id = aws_security_group.ecs_sg.id
  cidr_ipv6         = "::/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}
