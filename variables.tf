
variable "tags" {
  description = <<EOF
  Tags. Default:
  tags = {
    "unit" = "IT",
    "env"  = "dev",
    "owner" = "Sasa Popravak"
    }
  EOF
  type        = map(string)
  default = {
    "unit"  = "IT",
    "env"   = "dev",
    "owner" = "Sasa Popravak"
  }
}

variable "vmname" {
  description = "VM name. Default prefix: ubuntu"
  type        = string
  default     = "ubuntu"
}

variable "vmadmin" {
  description = "VM admin username . Default: malloy"
  type        = string
  default     = "malloy"
}

variable "vmpublisher" {
  description = "VM publisher. Default: Canonical"
  type        = string
  default     = "Canonical"
}

variable "vmsize" {
  description = "VM size. Default: Standard_D2s_v3"
  type        = string
  default     = "Standard_D2s_v3"
}

variable "vmoffer" {
  description = "VM offer. Default: 0001-com-ubuntu-server-jammy"
  type        = string
  default     = "0001-com-ubuntu-server-jammy"
}

variable "vmsku" {
  description = "VM SKU. Default: 22_04-lts-gen2"
  type        = string
  default     = "22_04-lts-gen2"
}

variable "vmversion" {
  description = "VM version. Default: latest"
  type        = string
  default     = "latest"
}

variable "vmosdisksize" {
  description = "VM OS disk size. Default: 50Gb"
  type        = string
  default     = "50"
}

variable "business_unit_prefix" {
  description = "Business Unit Prefix. Example: IT"
  type        = string
  default     = "IT"
}

variable "environment_prefix" {
  description = "Environment Prefix. Example: dev"
  type        = string
  default     = "dev"
}

variable "vmcount" {
  description = "Number of VMs. Default: 1"
  type        = number
  default     = 2
}
