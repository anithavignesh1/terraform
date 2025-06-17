terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.100.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}


resource "aws_instance" "web" {
  ami           = "ami-09e6f87a47903347c"
  instance_type = "t3.small"

  user_data = <<-EOF
                #!/bin/bash
                sudo yum update -y
                sudo yum install nginx -y
                EOF

  tags = {
    Name = "test"
  }
}