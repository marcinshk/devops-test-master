# Credentials are extracted from environment variables. Make sure to set them!
provider "aws" {
  region = "${var.region}"
}

variable "region" {
  default = "eu-west-1"
}

variable "readme-file" {
  default = "../devops-test/readme.html"
}

variable "test-file" {
  default = "../devops-test/test.zip"
}

resource "aws_s3_bucket" "devops-test" {
    bucket = "cmp-devops-test"
    acl = "public-read"
    policy = "${file("policy.json")}"

    website {
        index_document = "index.html"
    }

    tags {
      Name = "Devops-test"
      environment = "prod"
    }
}

resource "aws_s3_bucket_object" "readme" {
    bucket = "${aws_s3_bucket.devops-test.id}"
    key = "index.html"
    source = "${var.readme-file}"
    etag = "${md5(file(var.readme-file))}"
    content_type = "text/html"
}

resource "aws_s3_bucket_object" "test" {
    bucket = "${aws_s3_bucket.devops-test.id}"
    key = "test.zip"
    source = "${var.test-file}"
    etag = "${md5(file(var.test-file))}"
}

output "website-url" {
    value = "${aws_s3_bucket.devops-test.website_endpoint}"
}
