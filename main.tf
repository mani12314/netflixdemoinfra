provider "aws" {
  region = "us-southeast-2"
}

resource "aws_instance" "one" {
  count                  = 4
  ami                    = "ami-05493c6283642fb32"
  instance_type          = "t2.micro"
  key_name               = "poy"
  vpc_security_group_ids = ["sg-080a6d0011f38981d"]
  tags = {
    Name = var.instance_names[count.index]
  }
}

variable "instance_names" {
  default = ["jenkins", "tomcat-1", "tomcat-2", "Monitoring server"]
}
