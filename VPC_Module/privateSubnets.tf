# Private Subnets
resource "aws_subnet" "private_subnets" {
  count            = length(var.private_subnet_cidrs)
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = var.private_subnet_cidrs[count.index]
  map_public_ip_on_launch = false
  availability_zone = var.azs[count.index]
}
