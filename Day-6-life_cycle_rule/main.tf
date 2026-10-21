
resource "aws_instance" "dev" {
  ami= "ami-04f617474d20eae29"
  instance_type =  "t3.micro"
  tags = {
    Name = "dev-1"
  }

  lifecycle {
    # prevent_destroy = true
    create_before_destroy = true
    ignore_changes = [tags]
  }
}

