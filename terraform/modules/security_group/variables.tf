
variable "vpc_id" {
  type        = string
  description = "id of vpc"
}



variable "alb_ingress_ipv4" {
  type        = string
  description = "IPv4 CIDR allowed to reach the ALB"
}

variable "alb_ingress_ipv6" {
  type        = string
  description = "IPv6 CIDR allowed to reach the ALB"
  default     = ""
}

variable "app_container_port" {
  type        = number
  description = " the container your app logic says it deploys on"

}