provider "aws" {
  region     = "us-east-1"
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
}
resource "aws_vpc" "testvpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    "Name" = "test-vpc"
  }
}
resource "aws_subnet" "testsubnet" {
  vpc_id     = aws_vpc.testvpc.id
  cidr_block = "10.0.0.0/24"
  tags = {
    "Name" = "Private subnet"
  }
}
data "template_file" "myuserdata" {
  template = file("install_minikube.tpl")
}
resource "aws_instance" "test-server" {
  ami           = "ami-00ddb0e5626798373"
  instance_type = "t2.medium"
  #subnet_id     = aws_subnet.testsubnet.id
  key_name = "test"
  #user_data     = file("install_minikube.sh")
  user_data = data.template_file.myuserdata.template
  tags = {
    "Name" = "test-server"
  }
}
