
resource "aws_instance" "dev" {
  ami= "ami-04f617474d20eae29"
  instance_type =  "t3.micro"
  availability_zone = "ap-south-2a"
  user_data = file("test.sh")
  tags = {
    Name = "dev-1"
  }
}
