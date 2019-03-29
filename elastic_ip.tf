resource "aws_eip" "web" {
  instance = "${aws_instance.frontend.id}"
  vpc = true
}

resource "aws_eip" "nat" {
  vpc = true
}


