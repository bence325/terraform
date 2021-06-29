module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  cluster_name    = "${var.cluster_name}"
  cluster_version = "1.20"
  subnets         = module.vpc.public_subnets

  tags = {
    Name = "${var.cluster_name}"
  }

  vpc_id = module.vpc.vpc_id

  workers_group_defaults = {
    root_volume_type = "gp2"
  }

  worker_groups = [
    {
      name                          = "${var.cluster_name}-wg-1"
      instance_type                 = "${var.ec2_type}"
      additional_userdata           = "echo foo bar"
      additional_security_group_ids = [aws_security_group.pipeline-tf-1-sg.id]
      asg_desired_capacity          = 2
    }
  ]
}

data "aws_eks_cluster" "cluster" {
  name = module.eks.cluster_id
}

data "aws_eks_cluster_auth" "cluster" {
  name = module.eks.cluster_id
}
