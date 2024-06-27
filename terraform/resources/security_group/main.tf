# Create security group using Terraform Module
module "sg" {
  source = "terraform-aws-modules/security-group/aws"

  name                     = "${var.name}-${local.name}"
  description              = "Security group for user-service with custom ports open within VPC"
  vpc_id                   = var.vpc_id
  ingress_with_cidr_blocks = var.ingress_with_cidr_blocks
  egress_with_cidr_blocks  = var.egress_with_cidr_blocks
}