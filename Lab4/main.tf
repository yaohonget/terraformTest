locals {
  environment = "dev"
  common_tags = {
    Porject = "Terraform App"
    Environment = local.environment
  }
}

output "tags" {
  value = local.common_tags
}

#########

variable "project" {
  default = "NewProject"
}

variable "env" {
  default = "DEV"
}

output "welcome_message" {
  value = templatefile("${path.module}/template/welcome.tmpl", {
    project = var.project
    env = var.env
  })
}

##########

variable "amis" {
  default = {
    us-west-1 = "ami-123"
    us-east-1 = "ami-456"
  }
}

output "selected_ami" {
  value = lookup(var.amis, "us-east-1", "ami-default")
}

output "no_found_ami" {
  value = lookup(var.amis, "us-east-11", "ami-default")
}