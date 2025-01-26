variable "vpc_id" {
  description = "The ID of the VPC"
}

variable "private_subnet_ids" {
  description = "The ID of the private subnet"
    type        = list(string)
}

variable "ec2_sg_id" {
  description = "The ID of the EC2 security group"
}