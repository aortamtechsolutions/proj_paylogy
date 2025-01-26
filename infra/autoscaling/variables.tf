variable "private_subnet_ids" {
  description = "The IDs of the private subnets"
  type        = list(string)
}

variable "launch_template_id" {
  description = "The ID of the launch template"
}

variable "target_group_arn" {
  description = "The ARN of the target group"
}