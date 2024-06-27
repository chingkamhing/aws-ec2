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

module "security_group" {
  source = "./resources/security_group"

  owners                   = var.owners
  environment              = var.environment
  name                     = var.security_group_name
  ingress_with_cidr_blocks = var.security_group_ingress_blocks
  egress_with_cidr_blocks  = var.security_group_egress_blocks
  vpc_id                   = module.vpc.vpc_id
}
