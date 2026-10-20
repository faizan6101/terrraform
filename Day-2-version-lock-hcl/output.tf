output "publicip" {
  value = aws_instance.dev.private_ip
}

output "privateIp" {
  value = aws_instance.test.public_ip
}