resource "aws_lb" "int_ALB" {
  name                       = var.alb_name
  internal                   = false
  load_balancer_type         = var.load_balancer_type
  security_groups            = [var.backendSG]
  subnets                    = var.private_subnets
  enable_deletion_protection = false
  tags = {
    name = "ALB"
  }
}

resource "aws_lb_target_group" "ALB-target-grp2" {
  name     = "ALB-target-grp2"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id
}


resource "aws_lb_listener" "ALB_listener2" {
  load_balancer_arn = aws_lb.int_ALB.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.ALB-target-grp2.arn
  }
}
