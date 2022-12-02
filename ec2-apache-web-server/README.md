# Create Apache Webserver in AWS Using Terraform
# Milica Sucevic

## Installation of required AWS packages
- Install [AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/installing.html)
- Configure [AWS CLI](https://docs.aws.amazon.com/cli/latest/reference/configure/)

## Terraform setup in Linux based systems
```
wget https://releases.hashicorp.com/terraform/0.12.24/terraform_0.12.24_linux_amd64.zip
unzip terraform_0.12.24_linux_amd64.zip -d terraform /usr/local/bin/
```
If terraform executable stored in another path, make sure the path is added in `$PATH` variable permanently.

## AWS Infrastructure Automation
- Next it will be covered how to automate the AWS infrastructure creation using Terraform IAC
- In this demo we will build a Apache webserver and run a sample website
- Architecture of this server follows the single tier method, wherein we will create only a simple Webserver for demo purpose

![image](https://user-images.githubusercontent.com/93227818/205263607-ec9aa3d0-6eb1-415b-a0fc-e6a6540345dc.png)

## References used for this demo:

- Pre-Requisites - Setup Apache Webserver on AWS EC2 Instance: https://devopsrealtime.com/setup-apache-webserver-on-aws-ec2-instance/

- Project Task - Create Apache Web Server in AWS Using Terraform: https://dev.to/chefgs/create-apache-web-server-in-aws-using-terraform-1fpj

