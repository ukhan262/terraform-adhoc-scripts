terraform {
  required_providers {
    null = {
      source  = "hashicorp/null"
      version = "~> 3.2"
    }
  }
}

resource "null_resource" "hello_world" {
  # Changing this value forces the resource to be recreated (and the command to re-run)
  triggers = {
    message = "Hello, World!"
  }

  provisioner "local-exec" {
    command = "echo ${self.triggers.message}"
  }
}

output "hello_world" {
  value = null_resource.hello_world.triggers.message
}
