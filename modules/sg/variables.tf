variable "vpc-id" {
  description = "The ID of the VPC to attach the security groups to"
  type        = string
}

variable "cidr-block" {
  description = "The CIDR block to be used for the resource, such as a VPC or subnet. This defines the IP address range."
  type        = string
}
