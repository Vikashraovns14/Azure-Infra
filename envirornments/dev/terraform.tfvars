rgs = {
  rg1 = {
    name       = "rg-vk"
    location   = "centralindia"
    managed_by = "Terraform"
    tags = {
      env = "dev"
    }
  }
}

networks = {
  vnet1 = {
    name                = "vnet-vk"
    location            = "centralindia"
    resource_group_name = "rg-vk"
    address_space       = ["10.0.0.0/16"]
    tags = {
      environment = "dev"
    }
    subnets = [
      {
        name             = "frontend-subnet"
        address_prefixes = ["10.0.1.0/24"]
      },
      {
        name             = "backend-subnet"
        address_prefixes = ["10.0.2.0/24"]
      }
    ]
  }
}

public_ips = {
  app1 = {
    pip_name                = "pip-vk-1"
    resource_group_name = "rg-vk"
    location            = "centralindia"
    allocation_method   = "Static"
    tags = {
      app = "frontend"
      env = "prod"
    }
  }
  app2 = {
    pip_name                = "pip-vk-2"
    resource_group_name = "rg-vk"
    location            = "centralindia"
    allocation_method   = "Static"
    tags = {
      app = "frontend"
      env = "prod"
    }
  }
}

# key_vaults = {
#   kv1 = {
#     kv_name  = "kv-vk"
#     location = "centralindia"
#     rg_name  = "rg-vk"
#   }
# }
vms = {
  "vm1" = {
    vm_name                         = "frontend-vm11"
    rg_name                         = "rg-vk"
    location                        = "centralindia"
    size                            = "Standard_B1s"
    disable_password_authentication = false
    nic_name                        = "dev-nic111"
    pip_name                        = "frontend-pip11"
    subnet_name                     = "frontend-subnet"
    vnet_name                       = "vnet-vk"
    admin_username                  = "username"
    admin_password                  = "Password@12345"

    ip_configurations = [
      {
        ipconfig_name                 = "ipconfig1"
        private_ip_address_allocation = "Dynamic"
      }
    ]

    os_disk = [
      {
        caching              = "ReadWrite"
        storage_account_type = "Standard_LRS"
      }
    ]

    source_image_reference ={
        publisher = "Canonical"
        offer     = "UbuntuServer"
        sku       = "18.04-LTS"
        version   = "latest"
      }
    
  }

  "vm2" = {
    vm_name                         = "backend-vm11"
    rg_name                         = "rg-vk"
    location                        = "centralindia"
    size                            = "Standard_B1s"
    disable_password_authentication = false
    nic_name                        = "dev-nic112"
    pip_name                        = "backend-pip12"
    subnet_name                     = "backend-subnet"
    vnet_name                       = "vnet-vk"
    admin_username                  = "username"
    admin_password                  = "Password@12345"
    ip_configurations = [
      {
        ipconfig_name                 = "ipconfig2"
        private_ip_address_allocation = "Dynamic"
      }
    ]

    os_disk = [
      {
        caching              = "ReadWrite"
        storage_account_type = "Standard_LRS"
      }
    ]

    source_image_reference ={
        publisher = "Canonical"
        offer     = "UbuntuServer"
        sku       = "18.04-LTS"
        version   = "latest"
      }
    
  }
}
