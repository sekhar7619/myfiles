provider "aws" {
	region = "us-east-1"
	access_key = "AKIATLSAR5RGN7PITROV"
	secret_key     = "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"
}


# variables.tf

variable "aws_region" {
  description = "The AWS region where the VPC and subnets will be created."
}

variable "vpc_cidr" {
  description = "The CIDR block for the VPC."
}

variable "public_subnet_cidr" {
  description = "The CIDR block for the public subnet."
}

variable "private_subnet_cidr" {
  description = "The CIDR block for the private subnet."
}

variable "availability_zone_public" {
  description = "The availability zone for the public subnet."
}

variable "availability_zone_private" {
  description = "The availability zone for the private subnet."
}
