output "igw_id" {
  value = module.internet_gateway.igw_id
  description = "id of igw"
}

output "nat_id" {
  value = module.nat_gateway.nat_id
  description = "id of nat gateway"
}

output "vpc_id" {
  value = aws_vpc.main.id
  description = "id of vpc"
}

output "allocation_id" {
  value = aws_eip.nat.id
  description = "elastic ip id needed for public traffic i think "
}


### outputing for security_group module ###

output "cidr_ipv4" {
  value = aws_vpc.main.cidr_block
  description = "IPv4 addresses inside the VPC"
}


output "cidr_ipv6" {
  value = aws_vpc.main.ipv6_cidr_block
  description = "IPv6 addresses inside the VPC"
}

### outputting for ECS service submodule ###

output "private_subnet_ids" {
  value = module.private_subnets.private_subnet_ids
  description = "List of private subnet IDs used for internal resources "
}

### outputting for alb module ###

output "public_subnet_ids" {
  value = module.public_subnets.public_subnet_ids
  description = "List of public subnet IDs used for external resources "
}