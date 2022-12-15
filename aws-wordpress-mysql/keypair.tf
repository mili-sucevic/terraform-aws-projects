# Creating a New Key
resource "aws_key_pair" "keypair" {

  # Name of the Key
  key_name = var.keypair

  # Adding the SSH authorized key !
  public_key = file("~/.ssh/id_rsa.pub")
}