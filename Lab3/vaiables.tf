variable "aws_region" {
  description = "AWS Region"
  default = "us-east-1"
}

variable "ami_id" {
  description = "AMI ID in region"
}

variable "instance_type" {
  description = "Instance Type"
  default = "t2.micro"
}

variable "subnet_id" {
  description = "Subnet ID"
}