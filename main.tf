module "wordpress-installation" {
  source = "./wordpress-module"
aws_region = "us-east-1"
key_pair_public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCYucFNDdUhpkVFsUTikOm6zNPETa2OzQYQQmNIFuksgDg/E+NepT5t3jeHYlecSVry4QknQcFzk+Ei5T/jfQ0FrrFg48dgf4kZbyX4lwoOBFaVKuks31gejqp3Ry/Ot7hbSR1Lx0x+GWBwsNCIVBasoWLMBCo0Uj08dxQIW4c9RKmsLK7NOOtQ46Pbqp8hFuHaxEc627Btj/MdQCr/rnkSZjlUpQ07zOVIaTCcz/T3AjlgsCplz1pTQfUveKDtXKv22i7FNjXd+g/FhxTOfKleJKQquPMqh0U9KbN+GWypR5PvODuzAXUVxg+eRJ5iMyrgeJNKyjVACXHa2rynVwLfHnZ22hW5XsHLtgo6Nil0mqSxApxB6w1klJ8JEwLp+1utBLd65htS+32VqQdG1YG04jP2yicuEZt7eZc7gbJ37jXATknx5W2f9Qca6jPWdrsayVBStx7PKDgyjm/TRgTGB2UQkcUS3DHYGCtusWoSJHCB3vmAe4wFAogwgxqLdXM= lol@ts-MacBook-Pro.localdomain"
instance_type = "t3.micro"
db_allocated_storage = 10
db_name = "mydb"
db_engine = "mysql"
db_engine_version = "5.7"
db_instance_class = "db.t3.micro"
db_username = "foo"
db_password = "foobarbaz"
db_parameter_group_name = "default.mysql5.7"
instance_security_group_name = "wordpress-sg"
db_security_group_name  =   "wordpress-db-sg"
key_pair_name = "wp1"
}

module "wordpress-installation2" {
  source = "./wordpress-module"
aws_region = "us-east-1"
key_pair_public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCYucFNDdUhpkVFsUTikOm6zNPETa2OzQYQQmNIFuksgDg/E+NepT5t3jeHYlecSVry4QknQcFzk+Ei5T/jfQ0FrrFg48dgf4kZbyX4lwoOBFaVKuks31gejqp3Ry/Ot7hbSR1Lx0x+GWBwsNCIVBasoWLMBCo0Uj08dxQIW4c9RKmsLK7NOOtQ46Pbqp8hFuHaxEc627Btj/MdQCr/rnkSZjlUpQ07zOVIaTCcz/T3AjlgsCplz1pTQfUveKDtXKv22i7FNjXd+g/FhxTOfKleJKQquPMqh0U9KbN+GWypR5PvODuzAXUVxg+eRJ5iMyrgeJNKyjVACXHa2rynVwLfHnZ22hW5XsHLtgo6Nil0mqSxApxB6w1klJ8JEwLp+1utBLd65htS+32VqQdG1YG04jP2yicuEZt7eZc7gbJ37jXATknx5W2f9Qca6jPWdrsayVBStx7PKDgyjm/TRgTGB2UQkcUS3DHYGCtusWoSJHCB3vmAe4wFAogwgxqLdXM= lol@ts-MacBook-Pro.localdomain"
instance_type = "t3.micro"
db_allocated_storage = 10
db_name = "mydb2"
db_engine = "mysql"
db_engine_version = "5.7"
db_instance_class = "db.t3.micro"
db_username = "foo"
db_password = "foobarbaz"
db_parameter_group_name = "default.mysql5.7"
instance_security_group_name = "wordpress-sg2"
db_security_group_name  =   "wordpress-db-sg2"
key_pair_name = "wp2"
}

module "wordpress-installation3" {
  source = "./wordpress-module"
aws_region = "us-east-1"
key_pair_public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCYucFNDdUhpkVFsUTikOm6zNPETa2OzQYQQmNIFuksgDg/E+NepT5t3jeHYlecSVry4QknQcFzk+Ei5T/jfQ0FrrFg48dgf4kZbyX4lwoOBFaVKuks31gejqp3Ry/Ot7hbSR1Lx0x+GWBwsNCIVBasoWLMBCo0Uj08dxQIW4c9RKmsLK7NOOtQ46Pbqp8hFuHaxEc627Btj/MdQCr/rnkSZjlUpQ07zOVIaTCcz/T3AjlgsCplz1pTQfUveKDtXKv22i7FNjXd+g/FhxTOfKleJKQquPMqh0U9KbN+GWypR5PvODuzAXUVxg+eRJ5iMyrgeJNKyjVACXHa2rynVwLfHnZ22hW5XsHLtgo6Nil0mqSxApxB6w1klJ8JEwLp+1utBLd65htS+32VqQdG1YG04jP2yicuEZt7eZc7gbJ37jXATknx5W2f9Qca6jPWdrsayVBStx7PKDgyjm/TRgTGB2UQkcUS3DHYGCtusWoSJHCB3vmAe4wFAogwgxqLdXM= lol@ts-MacBook-Pro.localdomain"
instance_type = "t3.micro"
db_allocated_storage = 10
db_name = "mydb3"
db_engine = "mysql"
db_engine_version = "5.7"
db_instance_class = "db.t3.micro"
db_username = "foo"
db_password = "foobarbaz"
db_parameter_group_name = "default.mysql5.7"
instance_security_group_name = "wordpress-sg3"
db_security_group_name  =   "wordpress-db-sg3"
key_pair_name = "wp3"
}