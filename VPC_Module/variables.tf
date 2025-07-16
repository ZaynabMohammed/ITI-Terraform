variable "cidr_block" {
  type = string
  description = "The CIDR block for the VPC."
}

variable "vpc_name" {
  type = string
  description = "The name of the VPC."
}

variable "public_subnet_cidrs" {
  type = list(string)
  description = "List of CIDR blocks for public subnets."
}

variable "azs" {
  type = list(string)
  description = "List of availability zones."
}
variable "private_subnet_cidrs" {
  type = list(string)
  description = "List of CIDR blocks for private subnets."
}
