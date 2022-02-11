output "web_server_instance_id" {
  value = aws_instance.web_server.id
}

output "web_server_instance_ami" {
  value = aws_instance.web_server.ami
}

output "web_server_public_ip" {
  value = aws_instance.web_server.public_ip
}

output "web_server_private_ip" {
  value = aws_instance.web_server.private_ip
}

output "web_server_sg_id" {
  value = aws_security_group.web_server.id
}

output "web_server_sg_arn" {
  value = aws_security_group.web_server.arn
}

