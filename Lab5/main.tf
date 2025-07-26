locals {
  servers = [
    { name = "web1", instance = "t2.micro", enabled = true },
    { name = "web2", instance = "t2.micro", enabled = false },
    { name = "web3", instance = "t2.micro", enabled = true }
  ]

  enabled_servers = [for s in local.servers : s if s.enabled]
}

resource "aws_instance" "servers" {
  count = length(local.enabled_servers)
  ami = var.ami_id
  instance_type = local.enabled_servers[count.index].instance
  subnet_id = var.subnet_id

  tags = {
    Name = local.enabled_servers[count.index].name
  }
}