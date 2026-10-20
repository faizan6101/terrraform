
resource "aws_instance" "name" {
  ami           = "ami-04f617474d20eae29"
  instance_type = "t3.micro"
}