# This template is designed for deploying an EC2 instance from the Morpheus UI.

################################
##         Variables          ##
################################

variable "region" {}
variable "access_key" {}
variable "secret_key" {}

variable "instance_type" {
    default = "t2.micro"
}

variable "ami" {
    default = "ami-08d4ac5b634553e16"
}
variable "vpc" {
  default = "vpc-33ac354e"
}

variable "availability_zone" {
    default = "us-east-1b"
}

variable "security_groups" {
  default = "sg-2b299333"
}
variable "key_name" {
  default = "MorpheusApp"
}
variable "power_schedule" {
  default = "on"
}

locals {
  ec2_power_schedule = var.power_schedule
}

data "aws_subnet" "subnet" {
  availability_zone = var.availability_zone
  vpc_id            = var.vpc
}

#################################
##          Provider           ##
#################################

provider "aws" {
    region = var.region
    access_key = var.access_key
    secret_key = var.secret_key
}

#################################
##           Resources         ##
#################################

resource "aws_instance" "ec2" {
  instance_type           = var.instance_type
  ami                     = var.ami
  subnet_id               = data.aws_subnet.subnet.id
  vpc_security_group_ids  = [var.security_groups]
  user_data               = file("./userdata.sh")
  key_name                = var.key_name
  tags = {
    PowerSchedule = local.ec2_power_schedule
    }
}
