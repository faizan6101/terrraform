resource "aws_vpc" "main" {
  cidr_block = var.cidr-block
}

resource "aws_subnet" "main"{
 vpc_id=aws_vpc.main.id
  cidr_block = var.subnet-cidr 
  availability_zone = "var.availability-zone"
}

output"subnet_id"{
  value=aws_subnet.main.id
}