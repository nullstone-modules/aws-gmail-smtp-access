terraform {
  required_providers {
    ns = {
      source = "nullstone-io/ns"
    }
  }
}

data "ns_workspace" "this" {}

// Generate a random suffix to ensure uniqueness of resources
resource "random_string" "resource_suffix" {
  length  = 5
  lower   = true
  upper   = false
  numeric = false
  special = false
}

data "ns_connection" "gmail" {
  name = "gmail"
  contract = "datastore/aws/gmail"
}

locals {
  tags                       = data.ns_workspace.this.tags
  block_name                 = data.ns_workspace.this.block_name
  resource_name              = "${data.ns_workspace.this.block_ref}-${random_string.resource_suffix.result}"
  email_password_secret_name = data.ns_connection.gmail.outputs.email_password_secret_name
  email_account              = data.ns_connection.gmail.outputs.email_account
}
