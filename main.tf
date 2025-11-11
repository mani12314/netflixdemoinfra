provider "aws" {
  region = "ap-southeast-2"
}

resource "aws_instance" "one" {
  count                  = 4
  ami                    = "ami-0279a86684f669718 "
  instance_type          = "t2.micro"
  key_name               = "jekins"
  vpc_security_group_ids = ["sg-005dac616f2223950"]
  tags = {
    Name = var.instance_names[count.index]
  }
}

variable "instance_names" {
  default = ["jenkins", "tomcat-1", "tomcat-2", "Monitoring server"]
}
