resource "aws_ecr_repository" "cloud" {
  name                 = "2048"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }
}
