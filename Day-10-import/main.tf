resource "aws_instance" "name" {
  ami = "ami-0ff47f004dd7cde93"
  instance_type = "t3.micro"
    tags = {
        Name = "myec2"
    }
}
# terraform import aws_instance.name i-0494638bdca944765 -terraform import comand

