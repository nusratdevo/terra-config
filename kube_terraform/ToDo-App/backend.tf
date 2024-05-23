terraform {
  backend "s3" {
    bucket = "aws-eks-baket1"
    key    = "backend/ToDo-App.tfstate"
    region = "us-east-1"
  }
}