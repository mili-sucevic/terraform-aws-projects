# Static website Setup using Terraform and Ansible

In this project, we will be using Terraform as Iac to create a webserver which serves static website, which will be configured with Ansbile.

![image](https://user-images.githubusercontent.com/93227818/205681689-74f223c1-5428-49ea-a996-20a29dcb78d9.png)


Terraform create AWS resources:

- VPC
- Internet_gateway
- Subnet
- Route table association
- Security group
- EC2 instance
- S3 to save server state & save server state

Once the infrastructure is created run the ansible playbook for configuration management of the webserver

Ansible deploy web-server:
- Install Nginx
- Copy config, index.html files

Ansible command: ansible-playbook playbook.yml

Note : Change the iventory host IP with elastic IP of webhost

References: 
- https://github.com/MiteshSharma/TerraformAnsibleWebsite
- https://medium.com/@mitesh_shamra/deploying-website-on-aws-using-terraform-and-ansible-f0251ae71f42
- https://github.com/avgust-in/terraform-ansible-aws-nginx
