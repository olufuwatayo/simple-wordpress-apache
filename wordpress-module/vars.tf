
variable "aws_region" {
  description = "AWS region"
  default     = "us-east-1"
}

variable "key_pair_public_key" {
  description = "Public key for the key pair"
  default     = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCYucFNDdUhpkVFsUTikOm6zNPETa2OzQYQQmNIFuksgDg/E+NepT5t3jeHYlecSVry4QknQcFzk+Ei5T/jfQ0FrrFg48dgf4kZbyX4lwoOBFaVKuks31gejqp3Ry/Ot7hbSR1Lx0x+GWBwsNCIVBasoWLMBCo0Uj08dxQIW4c9RKmsLK7NOOtQ46Pbqp8hFuHaxEc627Btj/MdQCr/rnkSZjlUpQ07zOVIaTCcz/T3AjlgsCplz1pTQfUveKDtXKv22i7FNjXd+g/FhxTOfKleJKQquPMqh0U9KbN+GWypR5PvODuzAXUVxg+eRJ5iMyrgeJNKyjVACXHa2rynVwLfHnZ22hW5XsHLtgo6Nil0mqSxApxB6w1klJ8JEwLp+1utBLd65htS+32VqQdG1YG04jP2yicuEZt7eZc7gbJ37jXATknx5W2f9Qca6jPWdrsayVBStx7PKDgyjm/TRgTGB2UQkcUS3DHYGCtusWoSJHCB3vmAe4wFAogwgxqLdXM= lol@ts-MacBook-Pro.localdomain"
}

variable "instance_type" {
  description = "EC2 instance type"
  default     = "t3.micro"
}

variable "db_allocated_storage" {
  description = "RDS allocated storage"
  default     = 10
}

variable "db_name" {
  description = "RDS database name"
  default     = "mydb"
}

variable "db_engine" {
  description = "RDS database engine"
  default     = "mysql"
}

variable "db_engine_version" {
  description = "RDS database engine version"
  default     = "5.7"
}

variable "db_instance_class" {
  description = "RDS instance class"
  default     = "db.t3.micro"
}

variable "db_username" {
  description = "RDS username"
  default     = "foo"
}

variable "db_password" {
  description = "RDS password"
  default     = "foobarbaz"
}

variable "db_parameter_group_name" {
  description = "RDS parameter group name"
  default     = "default.mysql5.7"
}

variable "instance_security_group_name" {
    description = "Security group name"
    default     = "wordpress-sg"
  
}

variable "db_security_group_name" {
    description = "database Security group name"
    default     = "wordpress-db-sg"
  
}
  

variable "key_pair_name" {
  description = "key pair name"
  default = "wp-key"
}