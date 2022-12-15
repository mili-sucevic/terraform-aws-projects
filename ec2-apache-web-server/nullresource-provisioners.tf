# Create a Null Resource and Provisioners
resource "null_resource" "web-provisioners" {
  depends_on = [
    aws_instance.web,
    aws_security_group.sg-web
  ]

  # Connection Block for Provisioners to connect to EC2 Instance
  connection {
    type        = "ssh"
    host        = aws_eip.eip-manager.public_ip
    user        = "ec2-user"
    password    = ""
    private_key = file("private-key/tf-deploy.pem")
  }

  ## File Provisioner: Copies the terraform-key.pem file to /tmp/terraform-key.pem
  provisioner "file" {
    source      = "private-key/tf-deploy.pem"
    destination = "/tmp/tf-deploy.pem"
  }

  ## Remote Exec Provisioner: Using remote-exec provisioner fix the private key permissions on Bastion Host
  provisioner "remote-exec" {
    inline = [
      "sudo chmod 400 /tmp/tf-deploy.pem",
      "sudo yum update -y",
      "sudo yum install httpd -y",
      "sudo systemctl restart httpd && sudo systemctl enable httpd",
      "sudo yum install git -y",
      "sudo systemctl restart git && sudo systemctl enable git",
      "sudo touch /var/www/html",
      "sudo git clone https://bitbucket.org/dptrealtime/html-web-app/src/master/",
      "cd master",
      "sudo mv * /var/www/html"
    ]
  }
}