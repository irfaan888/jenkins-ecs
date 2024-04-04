resource "aws_security_group" "allow_ssh" {
  name        = "allow_tls"
  description = "Allow SSH traffic from jenkins controller"
  vpc_id      = aws_vpc.this.id

  tags = {
    Name = "allow_tls"
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
}

resource "aws_vpc_security_group_ingress_rule" "allow_ssh" {
  security_group_id = aws_security_group.allow_ssh.id
  cidr_ipv4         = aws_vpc.this.cidr_block
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
}

