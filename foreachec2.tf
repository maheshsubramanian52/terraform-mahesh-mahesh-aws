locals {
  instancetype = toset([
    "t2.micro",
    "t2.nano",
    "t2.large"
  ])
}

resource "aws_instance" "server" {
  for_each = local.instancetype

  ami           = "ami-0022f774911c1d690"
  instance_type = each.key # note: each.key and each.value are the same for a set

  tags = {
    Name = "Server ${each.key}"
  }
}
