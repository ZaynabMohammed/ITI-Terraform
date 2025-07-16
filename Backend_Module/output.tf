output "asg_sg_id" {
  description = "The ID of the Auto Scaling Group security group."
  value       = aws_security_group.asg_sg.id
  
}
