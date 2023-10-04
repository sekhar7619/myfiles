resource "aws_s3_bucket" "example" {
  bucket = "myfirstb12345"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}