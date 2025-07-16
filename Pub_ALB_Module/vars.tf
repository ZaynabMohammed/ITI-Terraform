variable "public_subnets" {
    type        = list(string)
    description = "List of public subnet IDs where the Proxy instances will be launched."
    default     = []
  
}
variable "vpc_id" {
    type        = string
    description = "The ID of the VPC where the ALB will be deployed."
    default     = ""
}
variable "load_balancer_type" {
    type        = string
    description = "The type of the load balancer (e.g., application, network)."
    default     = "application"
}
variable "proxy_instance_ids" {
    type        = list(string)
    description = "List of Proxy instance IDs to attach to the ALB target group."
    default     = []
  
}
variable "alb_name" {
    type        = string
    description = "The name of the Application Load Balancer."
    default     = "MyALB"
}
