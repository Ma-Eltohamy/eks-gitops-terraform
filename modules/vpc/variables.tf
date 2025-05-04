variable "vpc-cidr-block" { type = string }
variable "public-subnet-cidrs" { type = list(string) }
variable "private-subnet-cidrs" { type = list(string) }
variable "azs" { type = list(string) }
