
resource "aws_s3_bucket" "demo_bucket" {
  bucket = "sample-bucket-nikilkg-03072024"
  force_destroy = "true"
  tags = {
    name = "dev bucket"
  }
}
