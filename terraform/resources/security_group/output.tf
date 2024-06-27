output "security_group_id" {
  description = "The ID of the security group"
  value       = module.sg.security_group_id
}

output "security_group_arn" {
  description = "The ARN of the security group"
  value       = module.sg.security_group_arn
}
