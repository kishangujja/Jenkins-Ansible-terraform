provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "amzn_linux" {
  ami           = "ami-01816d07b1128cd2d"
  instance_type = "t2.micro"
  key_name      = "linux"
  vpc_security_group_ids = ["sg-01004a4ec49334e26"]
  tags = {
    Name = "amz-linux"
  }
}

resource "aws_instance" "ubuntu_linux" {
  ami           = "ami-0e2c8caa4b6378d8c"
  instance_type = "t2.micro"
  key_name      = "ubuntu-key"
  vpc_security_group_ids = ["sg-01004a4ec49334e26"]
  tags = {
    Name = "ubuntu22"
  }
}


output "amzn_linux_public_ip" {
  value = aws_instance.amzn_linux.public_ip
}

output "ubuntu_linux_public_ip" {
  value = aws_instance.ubuntu_linux.public_ip
}
