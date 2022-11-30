terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 5.0"
    }
  }
}

# Configure the GitHub Provider
provider "github" {
	token = ""
}

resource "github_repository" "mili-terraform-test" {
  name        = "mili-terraform-test"
  description = "My awesome codebase"

  visibility = "public"
}
