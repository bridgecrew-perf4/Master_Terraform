resource "aws_security_group" "web_server_sg" {
  name = "http_server_sg"
  description = "opens port 80 for http"
  vpc_id = "vpc-38bbf540" # default VPC 

  ingress {
    description = "open http"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = [ "0.0.0.0/0" ] 
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_key_pair" "key_pair" {
  key_name   = "test-keypair"
  public_key = file(var.public_key)
}

resource "aws_instance" "http_server" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"
  key_name = aws_key_pair.key_pair.key_name
  vpc_security_group_ids = [ aws_security_group.web_server_sg.id ]

  # connection {
  #   type = "ssh"
  #   host = self.public_ip
  #   user = "ubuntu"
  #   private_key = file(var.private_key)

  # }

  # provisioner "remote-exec" {
  #   inline = []
  # }

}

