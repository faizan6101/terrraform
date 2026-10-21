
resource "aws_instance" "dev" {
  ami= "ami-04f617474d20eae29"
  instance_type =  "t3.micro"
  tags = {
    Name = "dev-1"
  }
}

# cration of vpc
resource "aws_vpc" "name" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "dev-vpc"
  }
}

# creation of subnet
resource "aws_subnet" "name"{
 vpc_id=aws_vpc.dev.id
  cidr_block = "10.0.1.0/16"
  tags = {
    Name = "dev-subnet"
  }
}

# creation of internet gateway
resource "aws_internet_gateway" "name"{
  vpc_id = aws_vpc.dev.id
  tags = {
    Name = "dev-igw"
  }
} 

# creation of route table
resource "aws_route_table" "name"{
  vpc_id = aws_vpc.dev.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.name.id
  }
}

# creation of subnet association
resource "aws_route_table_association" "name"{
  subnet_id = aws_subnet.name.id
  route_table_id = aws_route_table.name.id
}

# creation of security group
resource "aws_security_group" "allow_tls" {
  name        = "dev-sg"
  description = "Allow SSH and HTTP"
  vpc_id = aws_vpc.dev.id 
  tags = {
    Name = "dev-sg"
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
}

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

}