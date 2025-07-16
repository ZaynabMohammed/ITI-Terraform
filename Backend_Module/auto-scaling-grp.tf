resource "aws_launch_template" "nginx-EC2s" {
  name_prefix            = var.launch_template_name
  image_id               = var.ami_id
  instance_type          = var.instance_type
  vpc_security_group_ids = [aws_security_group.asg_sg.id]
  key_name               = var.key_name
  user_data              = filebase64("install_nginx.sh")
}

resource "aws_autoscaling_group" "auto-grp" {
  vpc_zone_identifier = var.aws_Private_subnets
  target_group_arns    = [var.aws_lb_target_group_arn]
  desired_capacity    = 2
  max_size            = 4
  min_size            = 1

  launch_template {
    id      = aws_launch_template.nginx-EC2s.id
    version = "$Latest"
  }

  lifecycle {
    create_before_destroy = true
  }
}

