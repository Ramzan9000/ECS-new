
### VPC module and submodules ###

variable "cidr_block" {
  type        = string
  description = "Cidr of the VPC"
}


variable "region" {
  type        = string
  description = "AWS region of deployment"
}

variable "private_subnet_az_1_cidr" {
  type = string
  description = "Cidr for the first private VPC"
}


variable "private_subnet_az_2_cidr" {
  type = string
  description = "Cidr for the second private VPC"
}


variable "public_subnet_az_1_cidr" {
  type = string
  description = "Cidr block for the first public subnet"
}


variable "public_subnet_az_2_cidr" {
  type = string
  description = "Cidr block for the second public subnet"
}

variable "availability_zone_1" {
  type = string
  description = "First Availability Zone used for subnet deployment "
}

variable "availability_zone_2" {
  type = string
  description = "Second Availability Zone used for subnet deployment "
}



### ECR module ###


variable "ecr_repo_name" {
  type = string
  description = "name of ecr repo"
}



### secuirty_group module ###


variable "cidr_ipv4" {
  type = string
  description = "IPv4 addresses inside the VPC"
}

variable "cidr_ipv6" {
  type = string
  description = "IPv6 addresses inside the VPC"
}


### iam ###

variable "ecs_execution_role_name" {
  type = string
  description = "role name"
}


variable "ecs_execution_policy_name" {
  type = string
  description = "policy name"
}


### acm and route53 ###


variable "domain_name" {
  type = string
  description = "domain name"
}




### alb ###



variable "app_container_port" {
  type = number
  description = "Port that the application inside the container listens on"
}


### ecs ###


variable "task_cpu" {
  type = number
  description = " cpu units per ecs task "
}

variable "task_memory" {
  type = number 
  description = " memory per ecs task"
}


variable "container_port" {
  type = number
  description = "port app container is on"
}

variable "desired_task_count" {
  type        = number
  description = "Number of ECS tasks the service should maintain and run."
}

variable "use_placeholder" {
  type        = bool
  description = "Whether to run a placeholder container image (nginx) instead of the real application image."
}

variable "real_image" {
  type        = string
  description = "Docker image URI for the real application container stored in ECR."
}


variable "family" {
  type        = string
  description = "Name of the ECS task definition family."
}

variable "container_name" {
  type        = string
  description = "Name of the container defined inside the ECS task definition."
}