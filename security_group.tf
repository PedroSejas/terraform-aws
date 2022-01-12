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