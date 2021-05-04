variable "project" {
  type        = string
  description = "Three letter project key"
}

variable "stage" {
  type        = string
  description = "Name of the stage for this state"
}

variable "location" {
  type        = string
  description = "The azure location used for azure"
}

variable "resource_group" {
  type        = string
  description = "Name of the resource group to use"
}

variable "size" {
  type        = string
  description = "Size of state blob in bytes"
}
