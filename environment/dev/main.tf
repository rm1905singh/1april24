module "module_rgs" {
  source = "../../modules/1rgs"
  rgs    = var.rgs

}
module "module_vnet" {
  depends_on = [module.mrg]
  source     = "../../modules/2vnets"
  vnets      = var.vnets

}

module "module_subnets" {
  depends_on = [module.mvnet]
  source     = "../../modules/3subnets"
  subnets    = var.subnets

}
module "module_pips" {
  depends_on = [var.rgs]
  source     = "../../modules/4pips"
  pips       = var.pips

}
module "module_nics" {
  depends_on = [module.mpips]
  source     = "../../modules/5nics"
  nics       = var.nics

}
module "module_nsg" {
  depends_on    = [module.mrg]
  source        = "../../modules/6nsg"
  nsgs          = var.nsg
  security_rule = var.security_rule

}
module "module_nsgass" {
  depends_on = [module.mnsg]
  source     = "../../modules/7nsgass"
  nsgass     = var.nsgass

}
module "module_vm" {
  depends_on = [var.nics]
  source     = "../../modules/8vms"
  vms        = var.vms

}
module "module_bastion" {
  depends_on = [var.subnets]
  source     = "../../modules/9az_bastion"
  bastions   = var.bastions

}
module "module_appgateway" {
  depends_on  = [var.subnets]
  source      = "../../modules/10az_appgateways"
  app_gateway = var.app_gateway

}
module "module_svrs" {
  depends_on = [var.rgs]
  source     = "../../modules/11az_sqlsvr"
  mysqlsvrs  = var.mysqlsvrs

}
module "module_sql" {
  depends_on = [var.mysqlsvrs]
  source     = "../../modules/12az_sqldbs"
  sqldbs     = var.sqldbs

}
