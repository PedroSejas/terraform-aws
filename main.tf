provider "aws" {
    region = "us-east-1"
}

resource "aws_instance" "dev" {
    # Criacao de 3 instancias
    count = 3
    ami = "ami-04505e74c0741db8d"
    instance_type = "t2.micro"
    key_name = "terraform-aws"
    tags = {
      Name = "dev${count.index}"
    }
    # Usar o ID do grupo
    vpc_security_group_ids = ["${aws_security_group.acesso_ssh.id}"]
}

resource "aws_instance" "dev4" {
    ami = "ami-04505e74c0741db8d"
    instance_type = "t2.micro"
    key_name = "terraform-aws"
    tags = {
      Name = "dev4"
    }
    # Usar o ID do grupo
    vpc_security_group_ids = ["${aws_security_group.acesso_ssh.id}"]
    depends_on = [aws_s3_bucket.dev4]
}

resource "aws_instance" "dev5" {
    ami = "ami-04505e74c0741db8d"
    instance_type = "t2.micro"
    key_name = "terraform-aws"
    tags = {
      Name = "dev5"
    }
    # Usar o ID do grupo
    vpc_security_group_ids = ["${aws_security_group.acesso_ssh.id}"]
}


resource "aws_s3_bucket" "dev4" {
    bucket = "pjlabs-dev4"
    # acl = mantem o bucket privado
    acl = "private"

    tags = {
      Name = "pjlabs-dev4"
    }
}



