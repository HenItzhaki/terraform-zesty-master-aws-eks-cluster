mock_provider "aws" {
  mock_data "aws_eks_cluster" {
    defaults = {
      endpoint = "https://ABCDEF1234567890.gr7.us-east-1.eks.amazonaws.com"
      certificate_authority = [{
        data = "bW9jay1jYS1jZXJ0"
      }]
    }
  }
}

mock_provider "zesty" {}

mock_provider "helm" {}

run "module_creates_output" {
  command = apply

  variables {
    cluster_name = "test-cluster"
    region       = "us-east-1"
  }

  assert {
    condition     = module.zesty.kompass_values_yaml != null
    error_message = "module should output kompass_values_yaml"
  }
}

run "helm_release_config" {
  command = apply

  variables {
    cluster_name = "test-cluster"
    region       = "us-east-1"
  }

  assert {
    condition     = helm_release.kompass.namespace == "zesty-system"
    error_message = "helm release should target zesty-system namespace"
  }

  assert {
    condition     = helm_release.kompass.chart == "kompass"
    error_message = "helm release should use the kompass chart"
  }

  assert {
    condition     = helm_release.kompass.create_namespace == true
    error_message = "helm release should create the namespace"
  }
}
