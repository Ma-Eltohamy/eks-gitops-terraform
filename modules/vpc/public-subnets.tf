resource "aws_subnet" "public" {
  count                   = length(var.public-subnet-cidrs)
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.public-subnet-cidrs[count.index]
  availability_zone       = var.azs[count.index]
  map_public_ip_on_launch = true
  tags = {
    # this is a tag not an k8s annotation
    # and it's used to configure k8s to create an elastic load balancer (elb) 
    # and the value "1" is a convention for aws which means enabled or true
    # it's something like prepareing the vpc to contain an eks
    "kubernetes.io/role/elb" = "1" # this is a required tag for k8s & eks to deal with this vpc in appropriate way
    "Name"                   = "public-subnet-${count.index + 1}"
  }
}
