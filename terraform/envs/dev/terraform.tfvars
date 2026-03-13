cidr_block               = "10.0.0.0/16"
region                   = "eu-west-2"

public_subnet_az_1_cidr  = "10.0.1.0/24"
public_subnet_az_2_cidr  = "10.0.2.0/24"
private_subnet_az_1_cidr = "10.0.3.0/24"
private_subnet_az_2_cidr = "10.0.4.0/24"

availability_zone_1      = "eu-west-2a"
availability_zone_2      = "eu-west-2b"

ecr_repo_name            = "dev-thr-composer-repo"

cidr_ipv4                = "0.0.0.0/0"
cidr_ipv6                = "::/0"

ecs_execution_role_name   = "ecsTaskExecutionRole"
ecs_execution_policy_name = "ecsTaskExecutionPolicy"

domain_name              = "ramzans-lab.com"

app_container_port       = 80

task_cpu                 = 256
task_memory              = 512
container_port           = 80
desired_task_count       = 2

use_placeholder          = true
real_image               = "557690622944.dkr.ecr.eu-west-2.amazonaws.com/dev-thr-composer-repo:dev-latest"
family                   = "dev-thr-composer-task"
container_name           = "thr-composer"