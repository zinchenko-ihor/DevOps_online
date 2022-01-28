provider "aws" {
  region = "eu-central-1"
}

resource "aws_instance" "prod" {
  ami           = data.aws_ami.latest_ubuntu.id
  instance_type = "t2.micro"
}

resource "aws_instance" "test" {
  ami           = data.aws_ami.latest_amazon_linux.id
  instance_type = "t2.micro"
}

data "aws_ami" "latest_ubuntu" {
  owners       = ["099720109477"]
  most_recent = true
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }
}

data "aws_ami" "latest_amazon_linux" {
  owners = ["137112412989"]
  most_recent = true
  filter {
    name = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }

}




