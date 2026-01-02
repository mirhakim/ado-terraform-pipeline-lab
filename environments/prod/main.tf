module "resource_group" {
  source   = "../../modules/resource-group"
  name     = var.rg_name
  location = var.location
}

module "vnet" {
  source        = "../../modules/vnet"
  name          = "vnet-prod"
  location      = var.location
  rg_name       = module.resource_group.name
  address_space = ["10.20.0.0/16"]
}

module "subnet" {
  source           = "../../modules/subnet"
  name             = "subnet-prod"
  rg_name          = module.resource_group.name
  vnet_name        = module.vnet.name
  address_prefixes = ["10.20.1.0/24"]
}

module "nsg" {
  source   = "../../modules/nsg"
  name     = "nsg-prod"
  location = var.location
  rg_name  = module.resource_group.name
}

module "vm" {
  source           = "../../modules/vm"
  vm_name          = "vm-prod-01"
  location         = var.location
  rg_name          = module.resource_group.name
  subnet_id        = module.subnet.id
  vm_size          = "Standard_B2s"
  admin_username   = var.admin_username
  admin_password   = var.admin_password
}
