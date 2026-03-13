### vpc module ###

module "vpc" {
  source = "../../modules/vpc"

  cidr_block               = var.cidr_block
  public_subnet_az_1_cidr  = var.public_subnet_az_1_cidr
  public_subnet_az_2_cidr  = var.public_subnet_az_2_cidr
  private_subnet_az_1_cidr = var.private_subnet_az_1_cidr
  private_subnet_az_2_cidr = var.private_subnet_az_2_cidr
  availability_zone_1      = var.availability_zone_1
  availability_zone_2      = var.availability_zone_2
}


### ECR module ###

module "ecr" {
  source = "../../modules/ecr"
  ecr_repo_name = var.ecr_repo_name

}


### security_group module ###

module "security_group" {
  source = "../../modules/security_group"

  vpc_id = module.vpc.vpc_id
  cidr_ipv4 = module.vpc.cidr_ipv4
  cidr_ipv6 = module.vpc.cidr_ipv6
  app_container_port = var.app_container_port

  
}




### iam ###

module "iam" {
  source = "../../modules/iam"
  
  ecs_execution_role_name = var.ecs_execution_role_name
  ecs_execution_policy_name = var.ecs_execution_policy_name
 
}


### acm output from dns folder that made the hosted zone###

data "terraform_remote_state" "dns" {
  backend = "s3"

  config = {
    bucket = "my-tf-state-bucket-proj-new"
    key    = "envs/dns/terraform.tfstate"
    region = "eu-west-2"
  }
}

module "acm" {
  source = "../../modules/acm"
  
  domain_name    = var.domain_name
  hosted_zone_id = data.terraform_remote_state.dns.outputs.zone_id
 
}


### route53 ###

module "route53" {
  source = "../../modules/route53"

  domain_name     = var.domain_name
  name            = module.alb.aws_alb_dns_name
  hosted_zone_id  = data.terraform_remote_state.dns.outputs.zone_id
  alb_zone_id     = module.alb.aws_alb_zone_id
  
 
}


### alb ###


module "alb" {
  source = "../../modules/alb"

### actual alb ####
  alb_security_group_id = module.security_group.alb_sg_id
  public_subnet_ids     = module.vpc.public_subnet_ids


### listener submodule ###
  certificate_arn = module.acm.certificate_arn


### target_group ###

  app_container_port = var.app_container_port
  vpc_id = module.vpc.vpc_id
  use_placeholder    = var.use_placeholder

 
}




### ecs ###


module "ecs" {
  source = "../../modules/ecs"


### task_definition submodule ###
  
  family             = var.family
  execution_role_arn = module.iam.execution_role_arn
  container_name  = var.container_name
  container_port  = var.container_port
  task_cpu        = var.task_cpu
  task_memory     = var.task_memory
  region          = var.region

  use_placeholder = var.use_placeholder
  real_image      = var.real_image
 
### service submodule ###

  desired_task_count  = var.desired_task_count
  private_subnet_ids  = module.vpc.private_subnet_ids
  target_group_arn    = module.alb.target_group_arn
  security_groups     = [module.security_group.ecs_security_group_id]
  
}