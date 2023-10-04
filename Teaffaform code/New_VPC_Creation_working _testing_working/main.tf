# main.tf

#provider "aws" {
 # region = var.aws_region
#}

resource "aws_vpc" "my_vpc" {
  cidr_block = "10.0.0.0/16"  # Replace with your desired CIDR block for the VPC
  tags = {
    Name = "MyVPC"
  }
}

resource "aws_internet_gateway" "my_igw" {
  vpc_id = aws_vpc.my_vpc.id
}

resource "aws_subnet" "public_subnet_1" {
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = "10.0.1.0/24"  # Replace with your desired CIDR block for the first public subnet
  availability_zone = "us-east-1a"  # Change this to your desired availability zone
  tags = {
    Name = "PublicSubnet1"
  }
}

resource "aws_subnet" "public_subnet_2" {
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = "10.0.2.0/24"  # Replace with your desired CIDR block for the second public subnet
  availability_zone = "us-east-1b"  # Change this to your desired availability zone
  tags = {
    Name = "PublicSubnet2"
  }
}

resource "aws_security_group" "alb_sg" {
  name_prefix = "alb_sg_"
  vpc_id      = aws_vpc.my_vpc.id

  # Allow HTTP and HTTPS inbound traffic from anywhere
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Allow all outbound traffic
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "instance_sg" {
  name_prefix = "instance_sg_"
  vpc_id      = aws_vpc.my_vpc.id

  # Allow HTTP inbound traffic from ALB Security Group
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    security_groups = [aws_security_group.alb_sg.id]
  }
}

resource "aws_instance" "example_instance" {
  ami           = "ami-002070d43b0a4f171"  # Replace with your desired AMI ID
  instance_type = "t2.micro"  # Replace with your desired instance type
  subnet_id     = aws_subnet.public_subnet_1.id
  vpc_security_group_ids = [aws_security_group.instance_sg.id]
  tags = {
    Name = "ExampleInstance"
  }
}

resource "aws_lb" "example_lb" {
  name               = "example-lb"
  internal           = false
  load_balancer_type = "application"
  subnets            = [aws_subnet.public_subnet_1.id, aws_subnet.public_subnet_2.id]

  security_groups    = [aws_security_group.alb_sg.id]
}

resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.example_lb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type = "forward"
    target_group_arn = aws_lb_target_group.example_tg.arn
  }
}

resource "aws_lb_target_group" "example_tg" {
  name     = "example-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.my_vpc.id
}

resource "aws_lb_target_group_attachment" "example_tg_attachment" {
  target_group_arn = aws_lb_target_group.example_tg.arn
  target_id        = aws_instance.example_instance.id
  port             = 80
}
