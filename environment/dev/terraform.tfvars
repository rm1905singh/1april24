rgs = {
  rg = {
    name     = "rms11"
    location = "uk south"
  }
}
vnts = {
  vnet = {
    name                = "rm-network"
    location            = "uk south"
    resource_group_name = "rms11"
    address_space       = ["10.0.0.0/16"]
  }
}
subnets = {
  subnet = {
    name                 = "rm-subnet"
    resource_group_name  = "rms11"
    virtual_network_name = "rm-network"
    address_prefixes     = ["10.0.1.0/24"]
  }
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
    nicname                        = "rmsnics"
  }
}

