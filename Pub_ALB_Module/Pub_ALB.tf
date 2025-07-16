resource "aws_lb" "ALB" {
  name                       = var.alb_name
  internal                   = false
  load_balancer_type         = var.load_balancer_type
  security_groups            = [aws_security_group.alb_sg.id]
  subnets                    = var.public_subnets
  enable_deletion_protection = false
  tags = {
    name = "ALB"
  }
}

resource "aws_lb_target_group" "ALB-target-grp" {
  name     = "ALB-target-grp1"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id
}


resource "aws_lb_listener" "ALB_listener" {
  load_balancer_arn = aws_lb.ALB.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.ALB-target-grp.arn
  }
}

resource "aws_lb_target_group_attachment" "frontend_attachment" {
  count            = length(var.proxy_instance_ids)
  target_group_arn = aws_lb_target_group.ALB-target-grp.arn
  target_id        = var.proxy_instance_ids[count.index]
  port             = 80
}