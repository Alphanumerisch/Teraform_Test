terraform {
    required_providers {
        local = {source = "hashicorp/local", version = "> 2.4.0"}
    }
}

resource "local_file" "cfg" {
    filename = "${path.module}/cfg_${var.env}_${var.name}.ini}"
    content = <<EOT
name = ${var.name}
env = ${var.env}
num = ${var.number}
EOT
}

output "config_file" {
    value = local_file.cfg.filename
}
