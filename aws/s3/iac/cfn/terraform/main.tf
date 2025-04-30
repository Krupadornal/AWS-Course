
resource "aws_s3_bucket" "ak-s3-bucket" {
  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}