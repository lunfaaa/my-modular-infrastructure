# ec2.tf
module "ec2_cluster" {
  source                 = "terraform-aws-modules/ec2-instance/aws"
  version                = "~> 2.0"

  name                   = "my-cluster"
  instance_count         = 2

  ami                    = "ami-ebd02392"
  instance_type          = "t2.micro"
  vpc_security_group_ids = [module.ssh_security_group.this_security_group_id]
  subnet_ids = module.vpc.private_subnets

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}

module "ssh_security_group" {
  source  = "terraform-aws-modules/security-group/aws//modules/ssh"
  version = "~> 3.0"

  name = "ssh-server"
    description = "Security group for ssh-server with ssh ports open within VPC"
    vpc_id = module.vpc.vpc_id

    ingress_cidr_blocks = ["10.10.0.0/16"]
}
