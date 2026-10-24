
variable"allow_ports" {
  type = map(string)
  default = {
    22 = "203.0.0.0/24"
    80 = "0.0.0.0/0"
    443 = "0.0.0.0/0"
  }
}

# creation of security group
resource "aws_security_group" "allow_tls" {
  name        = "dev-sg"
  description = "Allow SSH and HTTP"


dynamic "ingress"{
for_each = var.allow_ports
content{
        description = "Allow inbound traffic on port ${ingress.key}"
        from_port   = ingress.key
        to_port     = ingress.key
        protocol    = "tcp"
        cidr_blocks = [ingress.value]
        self = true
        ipv6_cidr_blocks = []
        prefix_list_ids = []
        security_groups = []

}

}
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

}