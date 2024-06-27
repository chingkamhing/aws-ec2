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
  source = "./modules/vpc"

  region                             = var.region
  environment                        = var.environment
  owners                             = var.owners
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
