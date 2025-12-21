variable "rgs" {
  type = map(object({
    name       = string
    location   = string
    managed_by = string
    tags       = map(string)
  }))
}

variable "networks" {

  type = map(object({
    name                = string
    location            = string
    resource_group_name = string
    address_space       = list(string)
    tags                = optional(map(string))
    subnets = optional(list(object({
      name             = string
      address_prefixes = list(string)
    })),[])
  }))
}

variable "public_ips" {
  type = map(object({
    pip_name             = string
    resource_group_name  = string
    location             = string
    allocation_method    = string
  }))
}

# variable "key_vaults" {
# }

variable "vms" {
  type = map(object(
    {
      nic_name               = string
      location               = string
      rg_name                = string
      vnet_name              = string
      subnet_name            = string
      pip_name               = string
      vm_name                = string
      size                   = string
      admin_username         = string
      admin_password         = string
      source_image_reference = map(string)
    }
  ))
}

# variable "vms" {
#   type = map(object({
#     vm_name    = string
#     rg_name    = string
#     location   = string
#     subnet_key = string
#     pip_key    = string
#   }))
# }

