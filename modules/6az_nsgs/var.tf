variable "nsgs" {
  description = "this is for Dev"
  type = map(object({
    name     = string
    location = string
    tags     = null
  }))
}

variable "security_rule" {
  description = "this is for Dev"
  type = map(object({
    name     = string
    location = string
    tags     = null
  }))
}
