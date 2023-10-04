provider "aws" {
  region = "us-east-1" # Change this to your desired AWS region
  access_key = "AKIATLSAR5RGN7PITROV"
  secret_key     = "tl7NTm395SrW1mNnMPFRYXnx6h8lYE+vHntymdcK"
}

resource "aws_security_group" "example" {
  name_prefix = "example-sg"
  description = "Example security group"

  # Inbound rule for port 8081
  ingress {
    from_port   = 8081
    to_port     = 8081
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Inbound rule for port 9000
  ingress {
    from_port   = 9000
    to_port     = 9000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # You can add more ingress rules if needed
}

resource "aws_instance" "example" {
  ami           = "ami-002070d43b0a4f171" # Replace with your desired AMI ID
  instance_type = "t2.micro" # Change the instance type if needed
  security_groups = [aws_security_group.example.name]

  # You can add more instance configurations here
}
