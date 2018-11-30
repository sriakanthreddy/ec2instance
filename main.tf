#provider information
provider "aws" {
region ="us-east-1"
profile="default"
}

#Ec2 instance creation
resource "aws_instance" "server" {
ami                ="ami-09479453c5cde9639"
instance_type      ="t2.micro"
key_name           ="ubuntu_key"
vpc_security_group_ids=["${aws_security_group.my_sg.id}"]
tags {
name="helloworld"
}
}
#security group creation
resource "aws_security_group" "my_sg" {
name          ="my_sg"
description   ="allow all inbound traffic"
ingress {
from_port     =0
to_port       =0
protocol      ="-1"
cidr_blocks   =["0.0.0.0/0"]
}
egress {
from_port     =0
to_port       =0
protocol      ="-1"
cidr_blocks   =["0.0.0.0/0"]
}
}
#printing the public ip
output "pub_ip" {
value ="${aws_instance.server.public_ip}"
}
