# generic variables defined

# Business Division
variable "owners" {
  description = "organization this Infrastructure belongs"
  type        = string
  default     = ""
}

# Environment Variable
variable "environment" {
  description = "Environment Variable used as a prefix"
  type        = string
  default     = ""
}

# EC2 variables defined

# EC2 Name
variable "name" {
  description = "EC2 Name"
  type        = string
  default     = "ec2"
}

# EC2 instance type
variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.micro"
}

# EC2 AMI
variable "ami" {
  description = "EC2 AMI ID"
  type        = string
}

# EC2 security group id
variable "security_group_id" {
  description = "EC2 security group id"
  type        = string
}

# EC2 subnet id
variable "subnet_id" {
  description = "EC2 subnet id"
  type        = string
}

# The user data to provide when launching the EC2 instance.
variable "user_data" {
  description = "The user data to provide when launching the instanceEC2 ."
  type        = string
}

# Whether to associate a public IP address with an instance in a VPC
variable "associate_public_ip_address" {
  description = "Whether to associate a public IP address with an instance in a VPC"
  type        = bool
  default     = false
}

# EC2 enable monitoring
variable "monitoring" {
  description = "EC2 enable monitoring"
  type        = bool
  default     = false
}
