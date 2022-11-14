terraform {
  required_providers {
    mc = {
      source  = "nicholasjackson/mc"
      version = "0.1.4"
    }
  }
}


variable "start_x" {
  default = -1278
}

variable "start_y" {
  default = 24
}

variable "start_z" {
  default = 140
}

variable "height" {
  default = 20
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
