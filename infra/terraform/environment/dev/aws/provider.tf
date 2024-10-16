terraform {
  required_providers {
    aws = {
      version = "~> 5.68.0"
    }
  }
  # backend "s3" {
  #   bucket         = "ethan-s3-apne1-tfstate"
  #   region         = "ap-northeast-1"
  #   key            = "ethan/dev/aws/remote.tfstate"
  #   dynamodb_table = "ethan-dynamodb-apne1-tfstate-lock"
  # }
  backend "local" {
    path = "local.tfstate"
  }
  required_version = "~> 1.9.7"
}

provider "aws" {
  region = "ap-northeast-1"
}