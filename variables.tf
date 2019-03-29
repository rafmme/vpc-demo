variable "aws_region" {
  default = "eu-west-2"
}

variable "amis" {
  default = "ami-07dc734dc14746eab"
}

variable "vpc_cidr" {
  description = "CIDR for the whole VPC"
  default = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
  description = "CIDR for the Public Subnet"
  default = "10.0.0.0/24"
}

variable "private_subnet_cidr" {
  description = "CIDR for the Private Subnet"
  default = "10.0.1.0/24"
}

variable "instance_type" {
  description = "AWS Instance type"
  default = "t2.micro"
}

variable "keyPairName" {
  description = "key pair name"
  default = "newKeyPair"
}
