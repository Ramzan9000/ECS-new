
variable "vpc_id" {
  type = string
  description = "id of vpc"
}



variable "cidr_ipv4" {
  type = string
  description = "IPv4 addresses inside the VPC"
}


variable "cidr_ipv6" {
  type = string
  description = "IPv6 addresses inside the VPC"
}

variable "app_container_port" {
  type = number
  description = " the container your app logic says it deploys on"

}