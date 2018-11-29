provider "aws" {
region ="us-east-1"
profile="default"
}
resource "aws_instance" "server" {
ami          ="ami-009d6802948d06e52"
instance_type="t2.micro"
tags {
name="opentoworld"
}
}
