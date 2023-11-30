terraform {
   required_version = ">= 0.13"
  required_providers {
    flexibleengine = {
      source = "FlexibleEngineCloud/flexibleengine"
      version = ">= 1.24.2"
    }
  }
  }
provider "flexibleengine" {
  domain_name = "OCB0003292"
  user_name   = "ahmed.elnaggar"
  access_key  = var.access_key
  secret_key  = var.secret_key
  region      = "eu-west-0"
  tenant_id   = var.tenant_id
  }
