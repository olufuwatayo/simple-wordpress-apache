terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
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
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCYucFNDdUhpkVFsUTikOm6zNPETa2OzQYQQmNIFuksgDg/E+NepT5t3jeHYlecSVry4QknQcFzk+Ei5T/jfQ0FrrFg48dgf4kZbyX4lwoOBFaVKuks31gejqp3Ry/Ot7hbSR1Lx0x+GWBwsNCIVBasoWLMBCo0Uj08dxQIW4c9RKmsLK7NOOtQ46Pbqp8hFuHaxEc627Btj/MdQCr/rnkSZjlUpQ07zOVIaTCcz/T3AjlgsCplz1pTQfUveKDtXKv22i7FNjXd+g/FhxTOfKleJKQquPMqh0U9KbN+GWypR5PvODuzAXUVxg+eRJ5iMyrgeJNKyjVACXHa2rynVwLfHnZ22hW5XsHLtgo6Nil0mqSxApxB6w1klJ8JEwLp+1utBLd65htS+32VqQdG1YG04jP2yicuEZt7eZc7gbJ37jXATknx5W2f9Qca6jPWdrsayVBStx7PKDgyjm/TRgTGB2UQkcUS3DHYGCtusWoSJHCB3vmAe4wFAogwgxqLdXM= lol@ts-MacBook-Pro.localdomain"
}

resource "aws_instance" "web" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t3.micro"
  key_name =  aws_key_pair.deployer.key_name
  user_data = data.template_file.init.rendered
  vpc_security_group_ids = [aws_security_group.web_sg.id]

  tags = {
    Name = "wordpress-server"
  }
}




output "public_ip" {
    value = aws_instance.web.public_ip #Resourcetype_resourcename_attribute 
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
  vpc_security_group_ids = [aws_security_group.db_sg.id] # reference to the security group resource above
  allocated_storage    = 10
  db_name              = "mydb"
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = "db.t3.micro"
  username             = "foo"
  password             = "foobarbaz"
  parameter_group_name = "default.mysql5.7"
  skip_final_snapshot  = true
}

data "http" "ip" {
  url = "https://ifconfig.me/ip"
}

resource "aws_security_group" "web_sg" {
  name        = "web_sg"
  description = "Allow inbound traffic for web and ssh"

  ingress {
    description = "HTTP from anywhere"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "SSH from user IP"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["${data.http.ip.response_body}/32"] #10.10.10.1
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "web_sg"
  }
}

# New RDS security group
resource "aws_security_group" "db_sg" {
  name        = "db_sg"
  description = "Allow inbound traffic from web_sg to RDS"

  ingress {
    description = "MySQL from web_sg"
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    security_groups = [aws_security_group.web_sg.id] # allows only web_sg to access RDS
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "db_sg"
  }
}