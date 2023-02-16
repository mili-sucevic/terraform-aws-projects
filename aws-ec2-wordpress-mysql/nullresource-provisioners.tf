# Create a Null Resource and Provisioners
resource "null_resource" "wp-provisioners" {
  # Connection Block for Provisioners to connect to EC2 Instance
  connection {
    type        = "ssh"
    host        = aws_instance.wordpress.public_ip
    user        = "ec2-user"
    password    = ""
    private_key = file("private-key/tf-deploy.pem")
  }

  ## File Provisioner: Copies the terraform-key.pem file to /tmp/terraform-key.pem
  provisioner "file" {
    source      = "private-key/tf-deploy.pem"
    destination = "/tmp/terraform-key.pem"
  }

  ## Remote Exec Provisioner: Using remote-exec provisioner fix the private key permissions on Bastion Host
  provisioner "remote-exec" {
    inline = [
      "sudo chmod 400 /tmp/tf-deploy.pem",
      "sudo yum update -y",
      "sudo yum install php php-mysqlnd httpd -y",
      "wget https://wordpress.org/wordpress-4.8.14.tar.gz",
      "tar -xzf wordpress-4.8.14.tar.gz",
      "sudo cp -r wordpress /var/www/html/",
      "sudo chown -R apache.apache /var/www/html/",
      "sudo systemctl start httpd",
      "sudo systemctl enable httpd",
      "sudo systemctl restart httpd"
    ]
  }

  ## Local Exec Provisioner:  local-exec provisioner (Destroy-Time Provisioner - Triggered during deletion of Resource)
  /*  provisioner "local-exec" {
    command = "echo Destroy time prov `date` >> destroy-time-prov.txt"
    working_dir = "local-exec-output-files/"
    when = destroy
    #on_failure = continue
  }  
  */
}

# Create a Null Resource and Provisioners
resource "null_resource" "bastion-provisioners" {
  # Connection Block for Provisioners to connect to EC2 Instance
  connection {
    type        = "ssh"
    host        = aws_instance.bastion.public_ip
    user        = "ec2-user"
    password    = ""
    private_key = file("private-key/tf-deploy.pem")
  }

  ## File Provisioner: Copies the terraform-key.pem file to /tmp/terraform-key.pem
  provisioner "file" {
    source      = "private-key/tf-deploy.pem"
    destination = "/tmp/terraform-key.pem"
  }
}
# Creation Time Provisioners - By default they are created during resource creations (terraform apply)
# Destory Time Provisioners - Will be executed during "terraform destroy" command (when = destroy)