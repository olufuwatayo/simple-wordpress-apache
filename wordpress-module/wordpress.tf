terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = var.aws_region
}

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_key_pair" "deployer" {
  key_name   = "deployer-key"
  public_key = var.key_pair_public_key
}

resource "aws_instance" "web" {
  ami                    = data.aws_ami.ubuntu.id
  instance_type          = var.instance_type 
  key_name               = aws_key_pair.deployer.key_name
  user_data              = data.template_file.init.rendered
  vpc_security_group_ids = [aws_security_group.web_sg.id]

  tags = {
    Name = "wordpress-server"
  }
}

output "public_ip" {
  value = aws_instance.web.public_ip
}

data "template_file" "init" {
  template = file("${path.module}/templates/init.tpl")

  vars = {
    db_name     = aws_db_instance.default.name
    db_user     = aws_db_instance.default.username
    db_password = aws_db_instance.default.password
    db_host     = aws_db_instance.default.endpoint
  }
}

resource "aws_db_instance" "default" {
  vpc_security_group_ids = [aws_security_group.db_sg.id]
  allocated_storage      = var.db_allocated_storage
  db_name                = var.db_name
  engine                 = var.db_engine
  engine_version         = var.db_engine_version
  instance_class         = var.db_instance_class
  username               = var.db_username
  password               = var.db_password
  parameter_group_name   = var.db_parameter_group_name
  skip_final_snapshot    = true
}

data "http" "ip" {
  url = "https://ifconfig.me/ip"
}

resource "aws_security_group" "web_sg" {
  name        = var.instance_security_group_name
  description = "Allow inbound traffic for web and ssh"

  ingress {
    description = "HTTP from anywhere"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description    = "SSH from user IP"
    from_port      = 22
    to_port        = 22
    protocol       = "tcp"
    cidr_blocks    = ["${data.http.ip.response_body}/32"] #10.10.10.1
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = var.instance_security_group_name
  }
}

# New RDS security group
resource "aws_security_group" "db_sg" {
  name        = var.db_security_group_name
  description = "Allow inbound traffic from web_sg to RDS"

  ingress {
    description      = "MySQL from web_sg"
    from_port        = 3306
    to_port          = 3306
    protocol         = "tcp"
    security_groups = [aws_security_group.web_sg.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = var.db_security_group_name
  }
}
