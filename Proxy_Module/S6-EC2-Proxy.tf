
resource "aws_instance" "proxy" {
  count         = var.proxy_count
  ami           = var.Proxy_ami_id
  instance_type = var.instance_type
  subnet_id     = var.aws_Public_subnets[count.index] 
  key_name      = "EC2_key" # Adjust the path to your private key
  security_groups = [aws_security_group.Proxy_sg.id]
  associate_public_ip_address = true

  tags = {
    Name = "nginx-proxy-${count.index + 1}"
  }

  connection {
    type        = "ssh"
    user        = "ubuntu"
    private_key = file("${path.root}/Proxy_Module/EC2_key.pem") # Adjust the path to your private key
    host        = self.public_ip
  }

  # 1. Install and start Nginx via remote-exec
  provisioner "remote-exec" {
    inline = [
      # Update the package index
      "sudo apt update -y",
      # Upgrade installed packages
      "sudo apt upgrade -y",
      # Install Nginx
      "sudo apt install -y nginx",
      # Enable Nginx to start on boot
      "sudo systemctl enable nginx",
      # Start Nginx service
      "sudo systemctl start nginx"
    ]
  }

   provisioner "local-exec" {
    command = "echo public-ip${count.index + 1} ${self.public_ip} >> all-ips.txt"
  }
}