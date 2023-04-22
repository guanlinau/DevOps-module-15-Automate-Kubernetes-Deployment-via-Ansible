module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "19.10.1"

  cluster_name ="myapp-eks-cluster"
  cluster_version = "1.24"

  vpc_id = module.vpc.vpc_id
  subnet_ids = module.vpc.private_subnets

  tags = {
    environment = "development"
    application = "myapp"
  }

  eks_managed_node_groups = {

    dev = {
      min_size     = 2
      max_size     = 4
      desired_size = 3

      instance_types = ["t2.micro"]
    }
  }
}