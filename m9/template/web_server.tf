provider "aws" {
  region = "eu-central-1"
}

resource "aws_instance" "web_server"{
  ami           = "ami-0d527b8c289b4af7f"
  instance_type = "t2.micro"
  vpc_security_group_ids = [aws_security_group.web_server.id]
  user_data = "${file("install_apach.sh")}"
  
  tags = {
     Name = "Web_Server"
  }
}

resource "aws_security_group" "web_server" {
  name        = "web_server security group"
  description = "Allow web_server access"
  
  dynamic "ingress" {
   
   for_each = ["80", "8080", "443", "9021"]

   content {
    from_port        = ingress.value
    to_port          = ingress.value
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
   }

  }

  ingress {
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["93.73.118.103/32"]

  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  
  }

  tags = {
    Name = "web_server"
  }
  
  lifecycle {
    create_before_destroy = true 
  }
  
}


