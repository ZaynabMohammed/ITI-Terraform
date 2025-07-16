module "vpc" {
    source = "./VPC_Module"
    
    vpc_name    = "MainVPC"
    cidr_block  = "10.0.0.0/16"
    azs         = ["us-east-1a", "us-east-1b"]
    public_subnet_cidrs = ["10.0.1.0/24", "10.0.2.0/24"]
    private_subnet_cidrs = ["10.0.4.0/24", "10.0.5.0/24"]
    
}

module "Proxy" {
    source = "./Proxy_Module"
    ingress_ports = [22, 80]
    Proxy_ami_id = "ami-0e2c8caa4b6378d8c" 
    instance_type = "t2.micro"
    aws_Public_subnets = module.vpc.aws_Public_subnets
    proxy_count = 2 
    key_name    = var.EC2_key_name
    vpc_id      = module.vpc.vpc_id
}

module "Backend" {
    source = "./Backend_Module"
    launch_template_name = "MyLaunchTemplate"
    ami_id = "ami-0e2c8caa4b6378d8c" 
    instance_type = "t2.micro"
    aws_Private_subnets = module.vpc.aws_Private_subnets
    vpc_id = module.vpc.vpc_id
    proxy_sg = [module.Proxy.Proxy_sg_id]
    pub_alb_sg = [module.pub_alb.pub_alb_sg]
    key_name = var.EC2_key_name
    aws_lb_target_group_arn = module.int_alb.target_group_arn
}

module "pub_alb" {
    source = "./Pub_ALB_Module"
    alb_name = "MyALB"
    vpc_id = module.vpc.vpc_id
    public_subnets = module.vpc.aws_Public_subnets
    load_balancer_type = "application"
    proxy_instance_ids = module.Proxy.proxy_instance_ids
  
}
module "int_alb" {
    source = "./Internal_ALB_Module"
    alb_name = "intALB"
    vpc_id = module.vpc.vpc_id
    private_subnets = module.vpc.aws_Private_subnets
    load_balancer_type = "application"
    backendSG = module.Backend.asg_sg_id

}