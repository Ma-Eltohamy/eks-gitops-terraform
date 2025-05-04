variable "vpc-id" {
  type = string
}

variable "public-subnet-id" {
  type = string
}

variable "public-sg-id" {
  type = string
}

variable "instance-type" {
  type    = string
  default = "t3.micro"
}

variable "public-key-path" {
  default = "/home/mahmoud/.ssh/id_rsa.pub"
}
