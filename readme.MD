How to run ---
from root of repo
terraform apply -target=aws_ecr_repository.this -target=aws_key_pair.generated_key
cd docker/jenkins-controller/
paste the private key in credentials of jenkis.yaml file
docker build -t jenkins-controller .
docker tag jenkins-controller:latest 590183835677.dkr.ecr.us-east-1.amazonaws.com/serverless-jenkins-on-ecs:jenkins-controller
aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 590183835677.dkr.ecr.us-east-1.amazonaws.com
docker push 590183835677.dkr.ecr.us-east-1.amazonaws.com/serverless-jenkins-on-ecs:jenkins-controller
cd ../..
terraform apply -auto-approve
go to jenkins_url = "http://serverless-jenkins-on-ecs-1054555025.us-east-1.elb.amazonaws.com"
enter user/pass
run the existing job an verify from ec2 console

-------------------------------------------------------------

Improvements ---
1.Specific apply is not needed if we use depends_on in resources
2.private key need not be copied,minor code modification is needed 
3.building and pushing of docker images can also be done in local provisioner with null resource
4.wherever code is hardcoded (example jenkins user and password) can be stored in secret manager and retrieved from there.
5.VPC Endpoints were not used to reach AWS Services securely.
6.images also has critical nad high vulnerabilities from ecr scan can be improved
7.modules can be used to streamline code and terraform docs utility can be used to generate proper documentation.
8.jenkins version and plugins versions need to be narrowed down(latest versions of some plugins have open issues faced during development)
9.terraform provider version and terraform version also need to be defined

-------------------------------------------------------------
Notes ---
the code also includes to run jenkins agents as fargate tasks which is an alternative
