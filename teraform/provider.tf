terraform {
  required_providers {
    hyperv = {
      source  = "taliesins/hyperv"
      version = ">= 1.2.1"
    }
  }
}

provider "hyperv" {
  host     = "127.0.0.1"
  port     = 5986
  https    = true
  insecure = true
  use_ntlm = true
  user     = "administrator"
  password = "Quest2019"
}