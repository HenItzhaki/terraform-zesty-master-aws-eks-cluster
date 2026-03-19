mock_provider "aws" {}

mock_provider "zesty" {}

run "account_creates_output" {
  command = apply

  assert {
    condition     = module.zesty.kompass_values_yaml != null
    error_message = "account stack should output kompass_values_yaml"
  }
}
