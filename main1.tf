provider "aws"{
region ="us-east-1a"
profile="default"
}
resource "aws_instance" "server1" {
ami            ="ami-09479453c5cde9639"
instance_type  ="t2.micro"
security_groups=["opentoworld"]
count          =2
tags {
name="helloworld"
}
}

output "myip" {
value="${aws_instance.server.*.public_ip}"
}
