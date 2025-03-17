provider "aws" {
  region = "us-east-1"
}

resource "random_pet" "x" {
  length = 2
}

resource "random_pet" "y" {
  length = 2
}

resource "random_pet" "z" {
  length = 2
}

module "s3_x" {
  source      = "./modules/s3_x"
  bucket_name = "${random_pet.x.id}"
}

module "s3_y" {
  source        = "./modules/s3_y"
  bucket_name_y = "${random_pet.y.id}"
  bucket_name_x = "${random_pet.x.id}-nested"
}

module "s3_z" {
  source        = "./modules/s3_z"
  bucket_name_z = "${random_pet.z.id}"
  bucket_name_y = "${random_pet.y.id}-nested"
  bucket_name_x = "${random_pet.x.id}-double-nested"
}