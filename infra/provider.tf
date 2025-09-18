# infra/provider.tf
variable "hyperv_address"  { type = string }
variable "hyperv_username" { type = string }
variable "hyperv_password" { type = string, sensitive = true }

provider "hyperv" {
  address  = var.hyperv_address
  username = var.hyperv_username
  password = var.hyperv_password
  insecure = true
}
