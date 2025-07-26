module "ec2_module" {
  source = "./modules/ec2"
  ami_id = var.ami_id
  subnet_id = var.subnet_id
  instance_type = "t2.micro"
}