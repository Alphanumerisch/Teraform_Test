# 1) vSwitch (External) über feste Host-NIC
resource "hyperv_network_switch" "ext" {
  name            = local.switch_name
  notes           = "Managed by Terraform"
  type            = "External"
  net_adapter_name = local.host_nic_name
}

# 2) VHDX aus Golden-Image ins Zielverzeichnis klonen
resource "hyperv_vhd" "os" {
  source_path = var.source_vhdx
  path        = "${var.target_folder}/${var.vm_name}-os.vhdx"
}

# 3) VM (Gen2/UEFI) mit VHD und vNIC am neuen Switch
resource "hyperv_machine_instance" "vm" {
  name                  = var.vm_name
  generation            = 2
  processor_count       = var.cpu
  memory_startup_bytes  = var.memory_mb

  # Disk anhängen
  hard_disk_drives = [{
    controller_type     = "SCSI"
    controller_number   = 0
    controller_location = 0
    path                = hyperv_vhd.os.path
  }]

  # Netzwerkadapter
  network_adapters = [{
    name        = "eth0"
    switch_name = hyperv_network_switch.ext.name
  }]

  automatic_start_action = var.auto_start ? "StartIfRunning" : "Nothing"
  automatic_stop_action  = "Save"
}
