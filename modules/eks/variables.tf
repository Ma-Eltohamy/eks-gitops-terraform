variable "cluster-name" { type = string }
variable "node-group-name" { type = string }
variable "instence-types" { type = list(string) }
variable "scaling-config" { type = map(number) }
variable "private-subnet-ids" { type = list(string) }
variable "private-sg-ids" { type = list(string) }
variable "public-sg-ids" { type = list(string) }
variable "add-ons" { type = list(string) }
