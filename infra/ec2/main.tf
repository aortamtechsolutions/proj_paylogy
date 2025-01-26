resource "aws_launch_template" "web_server" {
  name_prefix   = "web-server-"
  image_id      = local.image_id
  instance_type = local.instance_type

  network_interfaces {
    associate_public_ip_address = false
    security_groups             = [var.ec2_sg_id]
  }

  user_data = base64encode(file("${path.module}/user_data.sh"))
}

output "launch_template_id" {
  value = aws_launch_template.web_server.id
}