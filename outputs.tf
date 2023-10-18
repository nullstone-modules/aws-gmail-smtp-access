output "env" {
  value = [
    {
      name  = "EMAIL_ACCOUNT"
      value = local.email_account
    }
  ]
}

output "secrets" {
  value = [
    {
      name  = "EMAIL_PASSWORD"
      value = data.aws_secretsmanager_secret_version.email_password.secret_string
    }
  ]
}

data "aws_secretsmanager_secret_version" "email_password" {
  secret_id = local.email_password_secret_name
}
