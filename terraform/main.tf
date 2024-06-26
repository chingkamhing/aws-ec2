#
# terraform
#

terraform {
  required_version = ">= 0.13"

  backend "s3" {
    bucket         = "teraform.kamching"
    key            = "ec2/terraform.tfstate"
    region         = "ap-southeast-1"
    dynamodb_table = "terraform_ec2"
  }
}

#
# provider
#

provider "aws" {
  region = var.region
}
