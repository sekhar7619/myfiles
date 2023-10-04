provider "aws" {
	region = "us-east-1"
	access_key = "AKIATLSAR5RGN7PITROV"
	secret_key     = "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"
}


# variables.tf

variable "aws_region" {
  description = "The AWS region where the resources will be created."
  default     = "us-east-1"  # Change this to your desired AWS region
}

variable "ami_id" {
  description = "The ID of the Amazon Machine Image (AMI) to use for instances."
 #Replace with the desired AMI ID. Example: "ami-002070d43b0a4f171"
 default     = "ami-002070d43b0a4f171"
}

variable "instance_type" {
  description = "The EC2 instance type to use for instances."
  default     = "t2.micro"  # Replace with your desired instance type
}

variable "min_size" {
  description = "The minimum number of instances in the Auto Scaling group."
  default     = 1
}

variable "max_size" {
  description = "The maximum number of instances in the Auto Scaling group."
  default     = 3
}

variable "desired_capacity" {
  description = "The desired number of instances in the Auto Scaling group."
  default     = 2
}

