terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.81.0"
    }
  }
}
provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "example1" {
  ami = "ami-0cbbe2c6a1bb2ad63"
  instance_type = "t2.micro"
  subnet_id = "subnet-0d0caf21b37d42d0a"
  tags = {
    Name = "Lab2 Test"
  }
}