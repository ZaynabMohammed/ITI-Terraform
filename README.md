# Terraform-aws-deploy-infra
## Secure Web App with Public Proxy + Private Backend on AWS using Terraform
<div style="display: flex; justify-content: space-between; align-items: center;">
  <img src="https://www.vectorlogo.zone/logos/terraformio/terraformio-ar21.svg"; alt="Terraform" width="100" height="100">
  <img src="https://www.vectorlogo.zone/logos/amazon_aws/amazon_aws-ar21.svg"; alt="AWS" width="100" height="100">
</div>
This project deploys a scalable and secure AWS infrastructure using Terraform.
It provisions networking, compute resources, and load balancers to host a full-stack web application.

# Architecture Overview
A VPC (10.0.0.0/16) consisting of:
- 2Public Subnets > EC2 instances acting as Nginx Reverse Proxies
- 2Private Subnets > EC2 instances running Web Application Backends (Node.js / Flask)
- NAT Gateway + Internet Gateway
- 2 Load Balancers:
      1. Public ALB > Directs traffic to proxy EC2 instances
      2. Internal ALB > Directs traffic from proxies to backend servers

#Infrastructure Diagram

<img src="https://github.com/ZaynabMohammed/ITI-Terraform/blob/master/arch.png" width="1000" height="600" >

# Build Arch
```bash
# Terraform Initialize
terraform init
# Terraform Validate
terraform validate
# Terraform Plan
terraform plan
# Terraform Apply
terraform apply
```
# Verification
After deployment:
1. Frontend: Access the public ALB DNS in your browser:
   ```bash
     http://<public-alb-dns>:8080
   ```
   <img src="https://github.com/ZaynabMohammed/ITI-Terraform/blob/master/final.png"  >

2. Backend: The proxy forwards traffic to the Internal ALB (port 80), serving the Node.js app.
   
 
