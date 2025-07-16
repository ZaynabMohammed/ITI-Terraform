output "vpc_id" {
    value = aws_vpc.my_vpc.id
}
output "aws_Public_subnets" {
    description = "List of public subnet IDs in the VPC."
    value = aws_subnet.public_subnets[*].id
  
}
output "aws_Private_subnets" {
    value = aws_subnet.private_subnets[*].id
    description = "List of private subnet IDs in the VPC."
}