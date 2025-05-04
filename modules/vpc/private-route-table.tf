resource "aws_route_table" "private-route-table" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat.id
  }

  tags = {
    Name = "private-route-table"
  }
}

resource "aws_route_table_association" "private-route-table-association" {
  count          = length(var.private-subnet-cidrs)
  subnet_id      = aws_subnet.private[count.index].id
  route_table_id = aws_route_table.private-route-table.id
}
