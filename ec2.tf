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

  tags = {
    Name = "wordpress-server"
  }
}




output "public_ip" {
    value = aws_instance.web.public_ip #Resourcetype_resourcename_attribute 
}


data "template_file" "init" {
  template = file("${path.module}/init.tpl")

  vars = {
    db_name     = aws_db_instance.default.name
    db_user     = aws_db_instance.default.username
    db_password = aws_db_instance.default.password
    db_host     = aws_db_instance.default.endpoint
  }
}
