terraform {
  required_providers {
    aws = {
      version = "~> 5.78.0"
    }
  }
  # backend "s3" {
  #   bucket         = "ethan-s3-apne1-tfstate"
  #   region         = "ap-northeast-1"
  #   key            = "ethan/dev/backend/remote.tfstate"
  #   use_lockfile   = true
  # }
  backend "local" {
    path = "local.tfstate"
  }
  required_version = "~> 1.10.0"
}

provider "aws" {
  region = "ap-northeast-1"
}