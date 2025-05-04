resource "aws_subnet" "private" {
  count             = length(var.private-subnet-cidrs)
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.private-subnet-cidrs[count.index]
  availability_zone = var.azs[count.index]
  tags = {
    "Name"                            = "private-subnet-${count.index + 1}"
    "kubernetes.io/role/internal-elb" = "1"
  }
}
