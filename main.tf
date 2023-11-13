provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "amzn_linux" {
  ami           = "ami-05c13eab67c5d8861"
  instance_type = "t2.micro"
  key_name      = "linux"
  vpc_security_group_ids = ["sg-04cb5f715d70d6f35"]
  tags = {
    Name = "amz-linux"
  }
}

resource "aws_instance" "ubuntu_linux" {
  ami           = "ami-0fc5d935ebf8bc3bc"
  instance_type = "t2.micro"
  key_name      = "ubuntu-key"
  vpc_security_group_ids = ["sg-04cb5f715d70d6f35"]
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