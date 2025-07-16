variable "launch_template_name" {
    type        = string
    description = "The name prefix for the launch template."
  
}

variable "ami_id" {
    type        = string
    description = "The AMI ID for the instances."

}

variable "instance_type" {
    type        = string
    description = "The instance type for the instances."

}   
variable "aws_Private_subnets" {
    type        = list(string)
    description = "List of private subnet IDs where the Auto Scaling group will launch instances."
}
variable "vpc_id" {
    type        = string
    description = "The ID of the VPC where the Auto Scaling group will be deployed."

}

variable "pub_alb_sg" {
    type        = list(string)
    description = "security group IDs for the Application Load Balancer (ALB)."
  
}
variable "proxy_sg" {
    type        = list(string)
    description = "security group IDs for the Proxy instances."

}

variable "key_name" {
    type        = string
    description = "The name of the key pair to use for SSH access to the instances."
    default = "EC2_key"

}
variable "aws_lb_target_group_arn" {
    type        = string
    description = "The ARN of the ALB target group to attach to the Auto Scaling group."
  
}