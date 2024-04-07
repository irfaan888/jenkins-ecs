# data.tf

################################################################################
# Get Current region
################################################################################

data "aws_region" "current" {}


################################################################################
# Get current AWS Account ID
################################################################################

data "aws_caller_identity" "this" {}

data "aws_secretsmanager_secret" "secrets" {
  arn = aws_secretsmanager_secret.ssh_key.arn
}

data "aws_secretsmanager_secret_version" "current" {
  secret_id = data.aws_secretsmanager_secret.secrets.id
}