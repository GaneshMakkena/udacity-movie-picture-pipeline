variable "k8s_version" {
  # EKS 1.25 is retired in current AWS accounts; keep the cluster on a
  # currently supported version that matches the CI kubectl client.
  default = "1.32"
}

variable "enable_private" {
  default = false
}

variable "public_az" {
  type        = string
  description = "Change this to a letter a-f only if you encounter an error during setup"
  default     = "a"
}

variable "private_az" {
  type        = string
  description = "Change this to a letter a-f only if you encounter an error during setup"
  default     = "b"
}
