
terraform {
 backend "s3" {
   bucket = "aws-eks-baket1"
   key    = "ec2/terraform.tfstate"
   region = "us-east-1"
   encrypt        = true
  }
  required_version = ">=0.13.0"
  required_providers {
    aws = {
      # version = ">= 2.7.0"
      version = "~> 5.0"
      source  = "hashicorp/aws"
    }
  }
}
