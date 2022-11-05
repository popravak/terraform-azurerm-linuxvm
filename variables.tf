
variable "rg_name" {
  description = "Resource group name"
  type        = string
  default     = "rgspo001"
}

variable "location" {
  description = "Resource group location"
  type        = string
  default     = "North Europe"
}

variable "tags" {
  description = "VM tags"
  type        = map(string)
  default = {
    "unit"  = "IT",
    "env"   = "dev",
    "owner" = "Sasa Popravak"
  }
}

variable "vmname" {
  description = "VM name prefix"
  type        = string
  default     = "ubuntu"
}

variable "vmadmin" {
  description = "VM admin username"
  type        = string
  default     = "malloy"
}

variable "vmpublisher" {
  description = "VM publisher"
  type        = string
  default     = "Canonical"
}

variable "vmsize" {
  description = "VM size"
  type        = string
  default     = "Standard_D2s_v3"
}

variable "vmoffer" {
  description = "VM offer"
  type        = string
  default     = "0001-com-ubuntu-server-jammy"
}

variable "vmsku" {
  description = "VM SKU"
  type        = string
  default     = "22_04-lts-gen2"
}

variable "vmversion" {
  description = "VM version"
  type        = string
  default     = "latest"
}

variable "vmosdisksize" {
  description = "VM OS disk size"
  type        = string
  default     = "50"
}

variable "business_unit_prefix" {
  description = "Business unit"
  type        = string
  default     = "IT"
}

variable "environment_prefix" {
  description = "Environment"
  type        = string
  default     = "dev"
}

variable "vmcount" {
  description = "Number of VMs to deploy"
  type        = number
  default     = 1
}
