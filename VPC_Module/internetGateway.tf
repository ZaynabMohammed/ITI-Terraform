resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.my_vpc.id
  
  tags = {
    Name = "${var.vpc_name}-internet-gateway"

  }
}