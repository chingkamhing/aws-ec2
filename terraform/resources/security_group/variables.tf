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

# security group variables defined

# Security Group Name
variable "name" {
  description = "Security Group Name"
  type        = string
  default     = "security_group"
}

# Security group ingress_with_cidr_blocks
variable "ingress_with_cidr_blocks" {
  description = "Security group ingress_with_cidr_blocks"
  type = list(object({
    description = string
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = string
  }))
}

# Security group egress_with_cidr_blocks
variable "egress_with_cidr_blocks" {
  description = "Security group egress_with_cidr_blocks"
  type = list(object({
    description = string
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = string
  }))
}

# VPC id
variable "vpc_id" {
  description = "The ID of the VPC"
  type        = string
}
