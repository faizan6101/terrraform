resource"aws_instance" "name" {
  ami = "ami-0ff47f004dd7cde93"
  instance_type = "t3.micro"
    count=length(var.ec2)
tags = {
        Name = var.ec2[count.index]
    }
}

variable"ec2" {
  type = list(string)
  default = ["dev-1","dev-2","dev-3"]
}