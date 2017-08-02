variable "name" {
  description = "VPC Name"
}

variable "cidr" {
  description = "VPC CIDR"
}

variable "public_subnet" {
  description = "VPC Public Subnets"
}

variable "enable_dns_hostnames" {
  description = "Enable Private DNS Communication"
  default = true
}

variable "enable_dns_support" {
  description = "Enable Private DNS Communication"
  default = true
}

output "public_subnet_id" {
  value = "${aws_subnet.public.id}"
}

output "vpc_id" {
  value = "${aws_vpc.tfb.id}"
}

output "cidr" {
  value = "${aws_vpc.tfb.cidr_block}"
}

