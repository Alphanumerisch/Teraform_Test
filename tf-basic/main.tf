terraform {
    required_version = ">= 1.4"
    required_providers {
        local = {source = "hashicorp/local", version = "> 2.4.0"}
        random = {source = "hashicorp/random", version = "> 3.5.1"}
    }
}

resource "random_id" "rid" {
    byte_length = 4
}

resource "local_file" "note" {
    filename = "${path.module}/out_${var.Message}\nrand=${random_id.rid.hex}"
    content = "region=${var.region}\nmessage=${var.Message}\nrand=${random_id.rid.hex}"
}

output "note_file" {
    value = local_file.note.filename
}
