# Provider Block
provider "aws" {
  region = "us-east-1"
}

resource "aws_iam_user" "lb" {
  name = var.usernumber
  path = "/system/"

  tags = {
    tag-key = "new-user-tag"
  }

}
