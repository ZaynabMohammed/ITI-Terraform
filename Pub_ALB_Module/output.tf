output "pub_alb_sg" {
    value       = aws_security_group.alb_sg.id
    description = "Security group ID for the Application Load Balancer (ALB)."
  
}
output "target_group_arn" {
    value       = aws_lb_target_group.ALB-target-grp.arn
    description = "ARN of the ALB target group."
  
}