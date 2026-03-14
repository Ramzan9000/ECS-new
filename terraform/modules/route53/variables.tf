

variable "domain_name" {
  type        = string
  description = "name of domain "
}


variable "name" {
  type        = string
  description = "The DNS name assigned by AWS to the Application Load Balancer. This is the endpoint that Route53 alias records point to"
}

variable "alb_zone_id" {
  type        = string
  description = "The Route53 hosted zone ID associated with the Application Load Balancer, used when creating alias DNS records"
}


variable "hosted_zone_id" {
  type        = string
  description = "The Route53 hosted zone ID associated with the Application Load Balancer, used when creating alias DNS records"
}
