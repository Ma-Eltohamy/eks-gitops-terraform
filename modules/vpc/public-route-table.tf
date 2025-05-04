resource "aws_route_table" "public-route-table" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }

  tags = {
    Name = "public-route-table"
  }
}

resource "aws_route_table_association" "public-route-table-association" {
  count          = length(var.public-subnet-cidrs)
  subnet_id      = aws_subnet.public[count.index].id
  route_table_id = aws_route_table.public-route-table.id
}
