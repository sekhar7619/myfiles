# terraform.tfvars

aws_region            = "us-east-1"  # Replace with your desired AWS region
vpc_cidr              = "10.0.0.0/16"  # Replace with your desired CIDR block for the VPC
public_subnet_cidr    = "10.0.1.0/24"  # Replace with your desired CIDR block for the public subnet
private_subnet_cidr   = "10.0.2.0/24"  # Replace with your desired CIDR block for the private subnet
availability_zone_public  = "us-east-1a"  # Change this to your desired availability zone for the public subnet
availability_zone_private = "us-east-1b"  # Change this to your desired availability zone for the private subnet
