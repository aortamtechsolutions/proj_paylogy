provider "aws" {
  region = "eu-north-1"
}

module "vpc" {
  source = "./vpc"
}

module "security_groups" {
  source = "./security_groups"
  vpc_id = module.vpc.vpc_id
}

module "alb" {
  source = "./alb"
  vpc_id = module.vpc.vpc_id
  public_subnet_ids = module.vpc.public_subnet_ids
  alb_sg_id = module.security_groups.alb_sg_id
}

module "ec2" {
  source = "./ec2"
  vpc_id = module.vpc.vpc_id
  private_subnet_ids = module.vpc.private_subnet_ids
  ec2_sg_id = module.security_groups.ec2_sg_id
}

module "autoscaling" {
  source = "./autoscaling"
  private_subnet_ids = module.vpc.private_subnet_ids
  launch_template_id = module.ec2.launch_template_id
  target_group_arn = module.alb.target_group_arn
}

module "cloudwatch" {
  source = "./cloudwatch"
  autoscaling_group_name = module.autoscaling.asg_name
}

module "iam" {
  source = "./iam"
}