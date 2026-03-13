locals {
  container_image = var.use_placeholder ? "nginx:alpine" : var.real_image
}