resource "aws_route_table" "rafmme_vpc_public_rtable" {
  vpc_id = "${aws_vpc.rafmme_vpc.id}"
  
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.rafmme_vpc_igw.id}"
  }

  tags {
    Name = "Public Subnet RTable"
  }
}

resource "aws_route_table_association" "rafmme_vpc_public" {
  subnet_id = "${aws_subnet.rafmme_public_subnet.id}"
  route_table_id = "${aws_route_table.rafmme_vpc_public_rtable.id}"
}

resource "aws_route_table" "nat" {
  vpc_id = "${aws_vpc.rafmme_vpc.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_nat_gateway.ngw.id}"
  }

  tags {
    Name = ""
  }
}

resource "aws_route_table_association" "nat" {
  subnet_id = "${aws_subnet.rafmme_private_subnet.id}" 
  route_table_id = "${aws_route_table.nat.id}"
}


