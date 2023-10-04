terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.20.1"
    }
  }
}

provider "aws" {
  region     = "us-east-1"
  access_key = "AKIATLSAR5RGN7PITROV"
  secret_key = "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"
  default_tags {
    tags = {
      #Source = "https://github.com/kunduso/add-aws-elb-ec2-terraform"
    }
  }
}