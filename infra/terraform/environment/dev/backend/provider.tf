terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.83.1"
    }

    http = {
      source  = "hashicorp/http"
      version = "~> 3.4.5"
    }

    random = {
      source  = "hashicorp/random"
      version = "~> 3.6.3"
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
  required_version = "~> 1.10.4"
}

provider "aws" {
  # Configuration options
}

provider "http" {
  # Configuration options
}

provider "random" {
  # Configuration options
}