
### for the alb resource ###

variable "alb_security_group_id" {
  type = string
  description = "ID of the security group attached to the Application Load Balancer"
}


variable "public_subnet_ids" {
  type = list (string)
  description = "List of public subnet IDs where the Application Load Balancer will be deployed. These subnets should be in different Availability Zones"
}


### listeners ###


variable "certificate_arn" {
  type = string
  description = "ARN of the ACM SSL/TLS certificate used by the load balancer for HTTPS."
}



### target_group ###


variable "app_container_port" {
  type = number
  description = "Port that the application inside the container listens on"

}


variable "vpc_id" {
  type = string
  description = "ID of the VPC where the load balancer and related networking resources are created."
}

variable "use_placeholder" {
  type        = bool
  description = "Whether the application is using a placeholder container, which affects the target group health check path."
}