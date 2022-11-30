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
	token = "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"
}

resource "github_repository" "mili-terraform-test" {
  name        = "mili-terraform-test"
  description = "My awesome codebase"

  visibility = "public"
}
