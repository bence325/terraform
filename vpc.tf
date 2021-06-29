provider "aws" {
  region = "${var.aws_region}"
  profile = "${var.aws_profile}"
}

data "aws_availability_zones" "available" {}

locals {
    cluster_name = "${var.cluster_name}"
}

module "vpc" {
    source  = "terraform-aws-modules/vpc/aws"
    version = "2.66.0"

    name                 = "${var.cluster_name}-vpc"
    cidr                 = "192.168.0.0/16"
    azs                  = data.aws_availability_zones.available.names
    private_subnets      = ["192.168.96.0/19", "192.168.128.0/19"]
    public_subnets       = ["192.168.0.0/19", "192.168.32.0/19"]
    enable_nat_gateway   = true
    single_nat_gateway   = true
    enable_dns_hostnames = true

    tags = {
      Name = "${var.cluster_name}-vpc"
    }

    public_subnet_tags = {
      Name = "${var.cluster_name}-subnet-public"
    }

    private_subnet_tags = {
      Name = "${var.cluster_name}-subnet-private"
    }

}
