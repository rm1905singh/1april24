rgs = {
  rg = {
    name     = "rms11"
    location = "uk south"
  }
}
vnets = {
  vnet1 = {
    name                = "rm-network"
    location            = "uk south"
    resource_group_name = "rms11"
    address_space       = ["10.0.0.0/16"]
  }
}
subnets = {
  subnet1 = {
    name                 = "rm-subnet"
    resource_group_name  = "rms11"
    virtual_network_name = "rm-network"
    address_prefixes     = ["10.0.1.0/24"]
  },
  subnet2 = {
    name                 = "AzureBastionSubnet"
    resource_group_name  = "rms11"
    virtual_network_name = "rm-network"
    address_prefixes     = ["10.0.1.0/27"]
  },
}

pips = {
  pip = {
    name                = "rm11pip"
    resource_group_name = "rms11"
    location            = "uk south"
  }
}

nics = {
  nic = {
    name                 = "rmsnics"
    location             = "uk south"
    resource_group_name  = "rms11"
    subnetname           = "rm-subnet"
    virtual_network_name = "rm-network"
    pipname              = "rm11pip"


  }
}
nsg = {
  nsg1 = {
    name                = "rmnsg"
    location            = "uk south"
    resource_group_name = "rms11"
  }
}
security_rule = {
  security_rule1 = {
    name              = "ssh1"
    priority          = "100"
    direction         = "Inbound"
    access            = "Allow"
    protocol          = "Tcp"
    source_port_range = "22"
  }
  security_rule2 = {
    name              = "ssh2"
    priority          = "101"
    direction         = "Inbound"
    access            = "Allow"
    protocol          = "Tcp"
    source_port_range = "80"
  },
  security_rule3 = {
    name              = "ssh3"
    priority          = "102"
    direction         = "Inbound"
    access            = "Allow"
    protocol          = "Tcp"
    source_port_range = "8000"
  },
}
nsgass = {
  nsgass = {
    name                 = "rmnsgass"
    subnetname           = "rm-subnet"
    virtual_network_name = "rm-network"
    resource_group_name  = "rms11"
    nsgname              = "rmnsg"
  }
}
vms = {
  vm = {
    name                            = "rmvms1"
    resource_group_name             = "rms11"
    location                        = "uk south"
    size                            = "Standard_F2"
    admin_username                  = "adminrm"
    admin_password                  = "adminrm@1234"
    disable_password_authentication = "False"
    nicname                         = "rmsnics"
  }
}
bastions = {
  bastion = {
    name                = "rm_bastion"
    location            = "us south"
    resource_group_name = "rm_rgs"
    subnet_name         = "AzureBastionSubnet"
    pip_name            = "rm_pip11"
  }
}
app_gateway = {
  app_gateway1 = {
    name                = "rm_gateway"
    location            = "us south"
    resource_group_name = "rm_rgs"
    subnet_name         = "rm_subnet"
    pip_name            = "rm_pip11"
  }
}
mysqlsvrs = {
  svr1 = {
    name                         = "rm_sqlserver"
    resource_group_name          = "rm_rgs"
    location                     = "us_south"
    version                      = "12.0"
    administrator_login          = "adminBU01"
    administrator_login_password = "Logo@1212"
  }
}
sqldbs = {
  db1 = {
    name         = "rm_db"
    svr_name     = "rm_sqlserver"
    collation    = "SQL_Latin1_General_CP1_CI_AS"
    license_type = "LicenseIncluded"
    max_size_gb  = 2
    sku_name     = "S0"
    enclave_type = "VBS"
  }
}

