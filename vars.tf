variable "aws_region" {
  description = "Region in which AWS Resources to be created"
  type        = string
  default     = "us-east-1"
}
variable "EC2_key_name" {
  description = "Name of the EC2 Key Pair"
  type        = string
  default     = "EC2_key"
  
}