
resource "aws_secretsmanager_secret" "db_password" {
 name = "jenkins/password"
}


resource "aws_secretsmanager_secret_version" "db_password_version" {
 secret_id = aws_secretsmanager_secret.db_password.id
 secret_string = "admin"
}

resource "aws_secretsmanager_secret" "ssh_key" {
 name = "jenkins/ssh-key"
}


resource "aws_secretsmanager_secret_version" "ssh_key_version" {
 secret_id = aws_secretsmanager_secret.ssh_key.id
 secret_string = tls_private_key.example.private_key_pem
}