# Verbindungs-Variablen kommen aus der GitHub Action (TF_VAR_*)
variable "hyperv_address"  { type = string }
variable "hyperv_username" { type = string }
variable "hyperv_password" { type = string, sensitive = true }

# Projekt-/VM-Variablen
variable "vm_name" {
  type    = string
  default = "ubuntu01"
}

variable "cpu" {
  type    = number
  default = 2
}

variable "memory_mb" {
  type    = number
  default = 4096
}

# Quelle: dein Golden Image (muss auf dem Hyper-V-Host erreichbar sein)
variable "source_vhdx" {
  type    = string
  default = "D:/golden/golden-ubuntu-22.vhdx"
}

# Ziel-Ordner für die neue VM (muss existieren)
variable "target_folder" {
  type    = string
  default = "D:/VMs/ubuntu01"
}

# Autostart/Stop-Verhalten
variable "auto_start" {
  type    = bool
  default = true
}
