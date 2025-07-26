variable "aws_region" {
  default = "us-east-1"
}

variable "ingress_rules" {
  description = "Incoming rules"
  type = list(object({
    port = number
    description = string
  }))
}

variable "ami_id" {}
variable "ami_type" {}
variable "subnet_id" {}
