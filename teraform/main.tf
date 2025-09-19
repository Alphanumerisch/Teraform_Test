resource "hyperv_network_switch" "aw-external" {
  name                = "aw-external"
  allow_management_os = true
  switch_type         = "external"
  net_adapter_names   = ["Management"]



}



