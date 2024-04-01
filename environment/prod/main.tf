module "mrg" {
  source = "../../modules/1rgs"
  rgs    = var.rgs

}
module "mvnet" {
  depends_on = [module.mrg]
  source     = "../../modules/2vnets"
  vnts       = var.vnts

}
module "msubnets" {
  depends_on = [module.mvnet]
  source     = "../../modules/3subnets"
  subnets    = var.subnets

}
module "mpips" {
  depends_on = [var.rgs]
  source     = "../../modules/4pips"
  pips       = var.pips

}
module "mnics" {
  depends_on = [module.mpips]
  source     = "../../modules/5nics"
  nics       = var.nics

}
module "mnsg" {
  depends_on    = [module.mrg]
  source        = "../../modules/6nsg"
  nsgs          = var.nsg
  security_rule = var.security_rule

}
module "mnsgass" {
  depends_on = [module.mnsg]
  source     = "../../modules/7nsgass"
  nsgass     = var.nsgass

}
module "mvm" {
  depends_on = [var.nics]
  source     = "../../modules/8vms"
  vms        = var.vms

}
