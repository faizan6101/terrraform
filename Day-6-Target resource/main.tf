
resource "aws_instance" "dev" {
  ami= "ami-04f617474d20eae29"
  instance_type =  "t3.micro"
  tags = {
    Name = "dev-1"
  }
}


resource "aws_s3_bucket" "name" {
  bucket = "dev-bucket"
  tags = {
    Name = "dev-1"
  }
}

# terraform plan -target=aws_s3_bucket.name