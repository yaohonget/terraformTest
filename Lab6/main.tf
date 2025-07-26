resource "aws_security_group" "web_sg" {
  name = "dynamic-web-sg"
  description = "web security group"

  dynamic "ingress" {
    for_each = var.ingress_rules
    content {
      from_port = ingress.value.port
      to_port = ingress.value.port
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
      description = ingress.value.description
    }
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "web-sg"
  }
}

resource "aws_instance" "web" {
  ami = var.ami_id
  instance_type = var.ami_type
  subnet_id = var.subnet_id
  vpc_security_group_ids = [aws_security_group.web_sg.id]
  tags = {
    Name = "dynamic-web-instance"
  }
}