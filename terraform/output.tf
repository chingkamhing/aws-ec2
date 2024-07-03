# EC2 AMI

output "server_public_ip" {
  description = "The AMI of the EC2"
  value       = module.server.public_ip
}

output "amzlinux_ami_id" {
  description = "The AMI of the EC2"
  value       = try(data.aws_ami.amazon-linux.id, "")
}

output "amzlinux_ami_name" {
  description = "The name of the EC2"
  value       = try(data.aws_ami.amazon-linux.name, "")
}
