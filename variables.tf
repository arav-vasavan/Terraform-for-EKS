variable "kubernetes_version" {
  default = 1.29
  description = "kubernetes version"
}


variable "vpc_cidr"{
    default = "10.0.0.0/16"
    description = "CIDR range for vpc"
}

