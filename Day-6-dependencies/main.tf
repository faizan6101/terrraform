# cration of vpc
resource "aws_vpc" "name" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "dev-vpc"
  }
  depends_on = [aws_s3_bucket.name.id]   // explicity --> after creation of s3 bucket vpc will be created
}


resource "aws_s3_bucket" "name" {
  bucket = "dev-bucket"
  tags = {
    Name = "dev-1"
  }
}