terraform {
  required_providers {
    mc = {
      source  = "nicholasjackson/mc"
      version = "0.1.4"
    }
  }
}

provider "mc" {
  endpoint = var.endpoint
  api_key = var.api_key
}

resource "mc_block" "block1" {
  count = var.height

  x = var.start_x
  y = var.start_y + count.index
  z = var.start_z
  material = "smooth_quartz"
}

resource "mc_block" "block2" {
  count = var.height

  x = var.start_x + 1
  y = var.start_y + count.index
  z = var.start_z
  material = "smooth_quartz"
}

resource "mc_block" "block3" {
  count = var.height

  x = var.start_x
  y = var.start_y + count.index
  z = var.start_z + 1
  material = "smooth_quartz"
}

resource "mc_block" "block4" {
  count = var.height
  x = var.start_x + 1
  y = var.start_y + count.index
  z = var.start_z + 1
  material = "smooth_quartz"
}
