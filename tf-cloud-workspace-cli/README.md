Migrating Terraform State to Terraform Cloud

![image](https://user-images.githubusercontent.com/93227818/204151922-155c9d72-f08b-45e4-8cb8-285e68806c2f.png)

1. Set Up the Environment

- In the terminal, once logged into your instance, change to the lab-migrate-state directory.
- Apply the Terraform configuration.
- In the AWS Management Console, navigate to the cloud_user in IAM and generate your Access key ID and Secret access key values.
- Copy or download your key to use during the Terraform Cloud setup.

2. Set Up Your Terraform Cloud Workspace

- Navigate to Terraform Cloud at https://app.terraform.io/session and create a free account (or log in if you have an existing account).
- Create an organization named ACG-Terraform-Labs.
- Create a workspace named labs-migrate-state using the CLI-driven workflowoption.
- Navigate to the Variables tab and add two environment variables: one named AWS_ACCESS_KEY_ID with a value of your Access key ID and one named AWS_SECRET_ACCESS_KEY with a value of your Secret access key.
- Navigate to User Settings and then Tokens, and create an API token called terraform_login.
- Copy your API token.

3. Add the Backend Configuration

- Log in to Terraform Cloud with the API token.
- Add the backend block provided to the configuration file.
- Initialize your working directory.
- Delete your terraform.tfstate file.

4. Apply the Updated Configuration and Confirm the State Was Saved to Terraform Cloud

- Apply your updated configuration.
- Confirm your state is saved to Terraform Cloud.
