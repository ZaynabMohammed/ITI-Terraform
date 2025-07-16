
output "target_group_arn" {
    value       = aws_lb_target_group.ALB-target-grp2.arn
    description = "ARN of the ALB target group."
  
}
output "int_dns" {
    value       = aws_lb.int_ALB.dns_name
    description = "DNS name of the internal ALB."
}