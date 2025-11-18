provider "aws" {
  region  = var.region
}


# Security Group
resource "aws_security_group" "custom_sg" {
  name        = "${var.project_name}-sg"
  description = "Allow 22, 80, 443, 3306, 2222"

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTPS"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "SSH"
    from_port   = 2222
    to_port     = 2222
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "mariadb"
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }


  egress {
    description = "All outbound"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.project_name}-sg"
  }
}



resource "aws_instance" "test" {
  ami           = var.ami_id
  instance_type = var.instance_type
  key_name      = "test-user-ap-northeast-1"
  security_groups = [
    aws_security_group.custom_sg.name
  ]


  tags = {
    Name = "${var.project_name}-ec2"
  }
}



