variable "app_gateway" {
  description = "this is for Dev"
  type = map(object({
    name     = string
    location = string
    tags     = optional
  }))
}
