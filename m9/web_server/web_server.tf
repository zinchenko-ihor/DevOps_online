provider "aws" {
  region = "eu-central-1"
}

resource "aws_instance" "web_server"{
  ami           = "ami-0d527b8c289b4af7f"
  instance_type = "t2.micro"
  vpc_security_group_ids = ["sg-0a5e41eee56c8c1db"]
  user_data = file("user_data.sh")
  
  tags = {
     Name = "Web_Server"
  }
}
/*
resource "aws_security_group" "Jenkins" {
  name        = "web_server security group"
  description = "Allow web_server access"
  
  ingress {
    description      = "Access to web_server"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
   # ipv6_cidr_blocks = [aws_vpc.main.ipv6_cidr_block]
  }

  ingress {
    description      = "TCP traffic"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
   # ipv6_cidr_blocks = [aws_vpc.main.ipv6_cidr_block]
  }
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
   # ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "web_server"
  }

}
*/
