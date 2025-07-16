variable "ingress_ports" {
    type        = list(number)
    description = "List of ports to allow ingress traffic on the Proxy security group."
}
variable "Proxy_ami_id" {
    type        = string
    description = "The AMI ID for the Proxy instances."

}
variable "aws_Public_subnets" {
    type        = list(string)
    description = "List of public subnet IDs where the Proxy instances will be launched."
}
variable "instance_type" {
    type        = string
    description = "The instance type for the Proxy instances."

}

variable "key_name" {
    type        = string
    description = "The name of the key pair to use for SSH access to the Proxy instances."
    default = "EC2_key"

}
variable "vpc_id" {
    type        = string
    description = "The ID of the VPC where the Proxy instances will be deployed."
  
}


variable "proxy_count" {
    type        = number
    description = "The number of Proxy instances to launch."
    default     = 2
  
}
variable "internal_alb_dns" {
    type        = string
    description = "The DNS name of the internal ALB to which the Proxy instances will forward traffic."
    default     = "" # This should be set to the internal ALB's DNS name after its creation
  
}
variable "Proxy_sg_id" {
    type        = string
    description = "The security group ID for the Proxy instances."
    default     = "" # This should be set to the Proxy security group ID after its creation
  
}
