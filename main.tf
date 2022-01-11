provider "aws" {
    region = "us-east-1"
}

resource "aws_instance" "dev" {
    count = 3
    ami = "ami-04505e74c0741db8d"
    instance_type = "t2.micro"
    key_name = "terraform-aws"
    tags = {
      Name = "dev${count.index}"
    }
}

resource "aws_security_group" "acesso_ssh" {
    name = "acesso_ssh"
    description = "acesso_ssh"

    ingress {
        from_port = 443
        to_port = 443
        protocol = "tcp"
        # Acesso ssh nao deixa liberado para todos
        # Atualizar o IP pois ele e dinamico
        cidr_blocks = ["172.31.0.0/16"]
    }
    tags = {
    Name = "ssh"
    }
}