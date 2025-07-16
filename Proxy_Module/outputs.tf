output "Proxy_sg_id" {
  description = "The ID of the Proxy security group."
  value       = aws_security_group.Proxy_sg.id

}

output "proxy_instance_ids" {
  description = "List of Proxy instance IDs."
  value       = aws_instance.proxy[*].id

}