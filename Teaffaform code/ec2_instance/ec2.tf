resource "aws_instance" "example_server" {
  ami           = "ami-002070d43b0a4f171"
  instance_type = "t2.micro"

  tags = {
    Name = "test-server"
  }
}