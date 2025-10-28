# SSH Key Pair
resource "aws_key_pair" "deployer" {
  key_name   = "sysinfo-deployer-key"
  public_key = file("~/.ssh/id_rsa.pub")  # Path to your public key
}

