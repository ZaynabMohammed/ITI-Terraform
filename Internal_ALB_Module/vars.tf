variable "private_subnets" {
    type        = list(string)
    description = "List of private subnet IDs where the Proxy instances will be launched."
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
variable "backend_instance_ids" {
    type        = list(string)
    description = "List of backend instance IDs to attach to the ALB target group."
    default     = []
  
}
variable "alb_name" {
    type        = string
    description = "The name of the Application Load Balancer."
    default     = "intALB"
}
variable "backendSG" {
    type        = string
    description = "The security group ID for the backend instances."
    default     = ""
}