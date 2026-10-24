
# creation of security group
resource "aws_security_group" "allow_tls" {
  name        = "dev-sg"
  description = "Allow SSH and HTTP"


ingress=[
    for port in [22, 80, 443] : {
        description = "inboubd rules"
        from_port   = port
        to_port     = port
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
        self = true
        ipv6_cidr_blocks = []
        prefix_list_ids = []
        security_groups = []

}
]

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

}