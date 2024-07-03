#
# terraform
#

terraform {
  required_version = ">= 1.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.6"
    }
  }

  backend "s3" {
    bucket         = "teraform.kamching"
    key            = "ec2/terraform.tfstate"
    region         = "ap-southeast-1"
    encrypt        = true
    dynamodb_table = "terraform_ec2"
  }
}

#
# VPC
#

module "vpc" {
  source = "./resources/vpc"

  region                             = var.region
  owners                             = var.owners
  environment                        = var.environment
  name                               = var.vpc_name
  cidr                               = var.cidr
  azs                                = var.azs
  public_subnets                     = var.public_subnets
  private_subnets                    = var.private_subnets
  database_subnets                   = var.database_subnets
  create_database_subnet_group       = var.create_database_subnet_group
  create_database_subnet_route_table = var.create_database_subnet_route_table
  enable_nat_gateway                 = var.enable_nat_gateway
  single_nat_gateway                 = var.single_nat_gateway
}

#
# Security Group
#

module "security_group" {
  source = "./resources/security_group"

  owners                   = var.owners
  environment              = var.environment
  name                     = var.security_group_name
  ingress_with_cidr_blocks = var.security_group_ingress_blocks
  egress_with_cidr_blocks  = var.security_group_egress_blocks
  vpc_id                   = module.vpc.vpc_id
}

#
# EC2
#
# al2023 ami format:
# 'al2023-[ami || ami-minimal]-2023.0.[release build date].[build number]-kernel-[version number]-[arm64 || x86_64]'
# As of 2024-07-03:
#   amzlinux_ami_id = "ami-06d753822bd94c64e"
#   amzlinux_ami_name = "al2023-ami-2023.5.20240701.0-kernel-6.1-x86_64"
#

data "aws_ami" "amazon-linux" {
  most_recent = true

  filter {
    name   = "owner-alias"
    values = ["amazon"]
  }

  filter {
    name   = "name"
    values = ["al2023-ami-2023.*-kernel-*-x86_64"]
  }
}

module "server" {
  source = "./resources/server"

  owners                      = var.owners
  environment                 = var.environment
  name                        = var.ec2_name
  instance_type               = var.instance_type
  ami                         = data.aws_ami.amazon-linux.id
  security_group_id           = module.security_group.security_group_id
  subnet_id                   = element(module.vpc.public_subnets, 0)
  key_name                    = var.key_name
  user_data                   = var.user_data
  associate_public_ip_address = var.associate_public_ip_address
  monitoring                  = var.monitoring
}
