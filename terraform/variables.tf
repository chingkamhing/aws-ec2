#
# variables
#

variable "project" {
  description = "Project name"
  type        = string
  default     = "aws-ec2"
}

variable "region" {
  description = "Deployment region"
  type        = string
  default     = "ap-southeast-1"
}
