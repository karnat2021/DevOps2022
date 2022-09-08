output "public_IP" {
  value = aws_instance.web.public_ip

}

output "private_IP" {
  value = aws_instance.web.private_ip

}

output "security_group_id" {
  value = aws_security_group.ssh.id

}