# vpc module variables
variable "vpc-cidr-block" { type = string }
variable "public-subnet-cidrs" { type = list(string) }
variable "private-subnet-cidrs" { type = list(string) }
variable "azs" {
  description = "Availability zones"
  type        = list(string)
}

# eks module variables
variable "cluster-name" { type = string }
variable "node-group-name" { type = string }
variable "instence-types" { type = list(string) }
variable "scaling-config" { type = map(number) }
variable "add-ons" { type = list(string) }

# bastion server variables
variable "bastion-instance-type" { type = string }


