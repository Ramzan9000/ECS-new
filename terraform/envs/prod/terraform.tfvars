app_container_port       = 80

task_cpu                 = 256
task_memory              = 512
container_port           = 80
desired_task_count       = 2

use_placeholder          = false #in prod it shouldnt use placeholder but to add our real image from our docker ci/cd workflow that updates our placeholder image with our real image we'll say false
real_image               = "557690622944.dkr.ecr.eu-west-2.amazonaws.com/dev-thr-composer-repo:dev-latest"
family                   = "dev-thr-composer-task"
container_name           = "thr-composer"