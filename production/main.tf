#This Terraform Code Deploys Basic VPC Infra.
provider "aws" {
  region = var.aws_region
}

terraform {
  backend "s3" {
    bucket = "workspacesbucket04"
    key    = "Prodution.tfstate"
    region = "us-east-1"
  }
}