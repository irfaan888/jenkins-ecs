

resource "tls_private_key" "example" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "generated_key" {
  key_name   = "serverless-jenkins-on-ecs1"
  public_key = tls_private_key.example.public_key_openssh
}