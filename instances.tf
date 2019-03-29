resource "aws_instance" "frontend" {
  ami = "${var.amis}"
  availability_zone = "${var.aws_region}"
  instance_type = "${var.instance_type}"
  key_name = "${var.keyPairName}"
  vpc_security_group_ids = ["${aws_security_group.web.id}"]
  subnet_id = "${aws_subnet.rafmme_public_subnet.id}"
  associate_public_ip_address = true

  tags {
    Name = "Frontend Instance"
  }
}

resource "aws_instance" "db_instance" {
  ami = "${var.amis}"
  availability_zone = "${var.aws_region}"
  instance_type = "${var.instance_type}"
  key_name = "${var.keyPairName}"
  vpc_security_group_ids = ["${aws_security_group.db_security_group.id}"]
  subnet_id = "${aws_subnet.rafmme_private_subnet.id}"

  tags {
    Name = "DB SERVER"
  }
}

