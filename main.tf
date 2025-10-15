terraform {
  required_providers {
    random = { source = "hashicorp/random", version = "~> 3.6" }
    local  = { source = "hashicorp/local", version = "~> 2.5" }
  }
}

# Makes a fun pet-like name (two words)
resource "random_pet" "name" {
  length = 2
}

# Writes a file on your computer with "Hello, <random name>!"
resource "local_file" "hello" {
  content  = "Hello, ${random_pet.name.id}!"
  filename = "${path.module}/hello.txt"
}
