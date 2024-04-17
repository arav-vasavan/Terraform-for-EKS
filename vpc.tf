provider "aws" {
  region = "us-east-1"
}
data "aws_availability_zones" "available" {
  
}

locals {
  cluster_name  = "arav-eks-${random_string.suffix.result}"
}

resource "random_string" "suffix" {
    length = 8
    special = false
  
}

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.7.1"

  name = "arav-eks-vpc"
  cidr = var.vpc_cidr
   azs = data.aws_availability_zones.available.names
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24"]
  public_subnets = ["10.0.4.0/24","10.0.5.0/24"]
  enable_nat_gateway = true
  single_nat_gateway = true
}