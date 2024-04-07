
################################################################################
# ECR
################################################################################

resource "awscc_ecr_repository" "this" {
  repository_name                 = var.application_name
  image_tag_mutability = "IMMUTABLE"
  empty_on_delete = true

  image_scanning_configuration = {
    scan_on_push = true
  }
   
  # depends_on = [
  #   aws_key_pair.generated_key
  # ]
  

}

resource "null_resource" "ecr_push" {

  provisioner "local-exec" {
      working_dir = "./docker/jenkins-controller"
      command = <<EOF
      aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin ${data.aws_caller_identity.this.account_id}.dkr.ecr.us-east-1.amazonaws.com
      docker build -t "${awscc_ecr_repository.this.repository_uri}:jenkins-controller" .
      docker push "${awscc_ecr_repository.this.repository_uri}:jenkins-controller"
      EOF
      }

  depends_on = [
    awscc_ecr_repository.this,
  ]

}