provider "aws" {
  region = "us-east-1" # Change this to your desired AWS region
  access_key = "AKIATLSAR5RGN7PITROV"
	secret_key     = "tl7NTm395SrW1mNnMPFRYXnx6h8lYE+vHntymdcK"
}
resource "aws_s3_bucket" "example" {
  bucket = "my-tf-test-bucket"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}