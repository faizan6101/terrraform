
resource "aws_instance" "dev" {
  ami= "ami-04f617474d20eae29"
  instance_type =  "t3.micro"
  tags = {
    Name = "dev-1"
  }
}


resource "aws_vpc" "dev" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "dev-vpc"
  }
}