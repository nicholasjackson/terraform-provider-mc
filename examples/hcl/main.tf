terraform {
  required_providers {
    mc = {
      source  = "nicholasjackson/mc"
      version = "0.1.4"
    }
  }
}

provider "mc" {
  endpoint = "http://workshop.hashicraft.com:9090"
  api_key = "supertopsecret"
}

data "mc_block" "existing" {
  x = -1278
  y = 23
  z = 152
}

module "tower" {
  source = "./module"
  height = 10
}

resource "mc_schema" "car" {
  x = -1278
  y = 24
  z = 129
  rotation = 90
  schema = "./car.zip"
}

output "existing" {
  value = data.mc_block.existing.id
}
