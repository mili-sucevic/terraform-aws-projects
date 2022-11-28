Use Terraform to Create an EKS Deployment

![image](https://user-images.githubusercontent.com/93227818/204362085-28d49144-bd1d-47be-b951-595abcf41ecf.png)

**1. Configure the AWS CLI**
- In the terminal, configure your AWS CLI using the AWS Access Key and AWS Secret Access Key provided with the lab credentials.
- Change to the 'lab-terraform-eks' directory.
- Review the Terraform configuration files.

**2. Deploy the EKS Cluster**
- Initialize your working directory.
- Deploy your EKS cluster.
- Configure 'kubectl' to interact with your EKS cluster.
- Confirm the cluster is up and running.

**3. Deploy the NGINX Pods**
- Download the lab_kubernetes_resources.tf file from the GitHub repo.
- Review the new configuration file.
- Deploy the resources to your EKS cluster.
- Confirm the deployment was successful.

**4. Destroy Your Cluster**
- Delete your cluster and all its resources.
- Confirm deletion.
