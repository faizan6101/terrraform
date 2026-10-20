
resource "aws_instance" "dev" {
  ami= var.ami_id
  instance_type = var.instance_type
}

resource "aws_instance" "test" {
  ami= var.ami_id
  instance_type = var.instance_type
}