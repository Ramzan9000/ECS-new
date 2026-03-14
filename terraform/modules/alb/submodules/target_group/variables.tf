
variable "app_container_port" {
  type        = number
  description = "Port that the application inside the container listens on"

}


variable "vpc_id" {
  type        = string
  description = "ID of the VPC where the load balancer and related networking resources are created."
}

variable "use_placeholder" {
  type        = bool
  description = "Whether to use the placeholder container health check path instead of the real app health check path."
}