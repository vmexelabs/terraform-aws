terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.6.0"
    }
  }
}

provider "aws" {
  #region = "ap-southeast-2"
  region = var.default_region
}
