# Configure the AWS Provider
provider "aws" {
  region = "ap-southeast-2"
}

variable vpc_cidr_block {}
variable private_subnets_block {}
variable public_subnets_block {}

data "aws_availability_zones" "azs" {}

module "vpc" {
  source = "terraform-aws-modules/vpc/aws"
  version = "4.0.1"

  name = "myapp-vpc"
  cidr = var.vpc_cidr_block

  azs = data.aws_availability_zones.azs.names
  private_subnets = var.private_subnets_block
  public_subnets  = var.public_subnets_block

  enable_nat_gateway = true
  single_nat_gateway = true
  enable_dns_hostnames = true

  tags = {
    "kubernetes.io/cluster/myapp-eks-cluster"="shared"
  }
  public_subnet_tags = {
    "kubernetes.io/cluster/myapp-eks-cluster"="shared"
    "kubernetes.io/role/elb"=1

  }
  private_subnet_tags = {
    "kubernetes.io/cluster/myapp-eks-cluster"="shared"
    "kubernetes.io/role/private-elb"=1
  }
}
