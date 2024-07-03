#
# Generic Variables
#
region      = "ap-southeast-1"
environment = "dev"
owners      = "myserver"

#
# VPC Variables
#
vpc_name                           = "vpc"
cidr                               = "10.0.0.0/16"
azs                                = ["ap-southeast-1a", "ap-southeast-1b", "ap-southeast-1c"]
public_subnets                     = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]
private_subnets                    = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
database_subnets                   = ["10.0.151.0/24", "10.0.152.0/24", "10.0.153.0/24"]
create_database_subnet_group       = false
create_database_subnet_route_table = false
enable_nat_gateway                 = true
single_nat_gateway                 = true

#
# Security Group Variables
#
security_group_name = "security_group"
security_group_ingress_blocks = [
  {
    description = "ssh port"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = "0.0.0.0/0"
  },
  {
    description = "http port"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = "0.0.0.0/0"
  },
  {
    description = "https port"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = "0.0.0.0/0"
  },
]
security_group_egress_blocks = [
  {
    description = "everything"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = "0.0.0.0/0"
  },
]

#
# EC2 Variables
#
ec2_name                    = "ec2"
instance_type               = "t2.micro"
key_name                    = "myserver-key"
associate_public_ip_address = true
monitoring                  = true
# ec2 user data which install nginx and start it
user_data = <<-EOF
#!/bin/bash
sudo yum update -y
sudo yum install -y docker glibc-langpack-en make git

# enable and start docker service
sudo systemctl enable docker
sudo systemctl start docker
sudo usermod -a -G docker $USER

# install docker-compose
sudo curl -L https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
EOF
