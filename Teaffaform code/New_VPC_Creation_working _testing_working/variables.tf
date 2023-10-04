# variables.tf

#variable "aws_region" {
 # description = "The AWS region where the resources will be created."
  #default     = "us-east-1"  # Change this to your desired AWS region
#}


provider "aws" {
	region = "us-east-1"
	access_key = "AKIATLSAR5RGN7PITROV"
	secret_key     = "tl7NTm395SrW1mNnMPFRYXnx6h8lYE+vHntymdcK"
}

# variables.tf

variable "aws_region" {
  description = "The AWS region where the resources will be created."
  default     = "us-east-1"  # Change this to your desired AWS region
}

variable "vpc_cidr" {
  description = "The CIDR block for the VPC."
  default     = "10.0.0.0/16"  # Replace with your desired CIDR block for the VPC
}

variable "public_subnet_cidr" {
  description = "The CIDR block for the public subnet."
  default     = "10.0.1.0/24"  # Replace with your desired CIDR block for the public subnet
}

variable "private_subnet_cidr" {
  description = "The CIDR block for the private subnet."
  default     = "10.0.2.0/24"  # Replace with your desired CIDR block for the private subnet
}

variable "availability_zone_public" {
  description = "The availability zone for the public subnet."
  default     = "us-east-1a"  # Change this to your desired availability zone for the public subnet
}

variable "availability_zone_private" {
  description = "The availability zone for the private subnet."
  default     = "us-east-1b"  # Change this to your desired availability zone for the private subnet
}
