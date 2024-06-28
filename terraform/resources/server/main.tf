# Create EC2 using Terraform Module
module "server" {
  source = "terraform-aws-modules/ec2-instance/aws"

  name                        = "${var.name}-${local.name}"
  instance_type               = var.instance_type
  ami                         = var.ami
  vpc_security_group_ids      = [var.security_group_id]
  subnet_id                   = var.subnet_id
  associate_public_ip_address = var.associate_public_ip_address
  monitoring                  = var.monitoring
}