resource "aws_internet_gateway" "rafmme_vpc_igw" {
  vpc_id = "${aws_vpc.rafmme_vpc.id}"

  tags = {
    Name = "rafmme_vpc_igw"
  }
}

resource "aws_nat_gateway" "ngw" {
  allocation_id = "${aws_eip.nat.id}"
  subnet_id = "${aws_subnet.rafmme_public_subnet.id}"

  tags {
    Name = "Rafmme Nat GW"
  }

  depends_on = ["aws_internet_gateway.rafmme_vpc_igw"]
}
