# Generic Variables
region      = "ap-southeast-1"
environment = "dev"
owners      = "aws-ec2"

# VPC Variables
name                               = "vpc"
cidr                               = "10.0.0.0/16"
azs                                = ["ap-southeast-1a", "ap-southeast-1b", "ap-southeast-1c"]
public_subnets                     = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]
private_subnets                    = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
database_subnets                   = ["10.0.151.0/24", "10.0.152.0/24", "10.0.153.0/24"]
create_database_subnet_group       = false
create_database_subnet_route_table = false
enable_nat_gateway                 = true
single_nat_gateway                 = true
