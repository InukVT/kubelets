module "kubernetes_nodes" {
  for_each = var.nodes

  source = "./modules/proxmox_vm"

  node_name    = each.key
  vmid         = each.value.vmid
  cpu_cores    = each.value.cpu_cores
  memory_mb    = each.value.memory_mb
  target_nodes = each.value.target_nodes
  mac_address  = each.value.mac_address
  smbios_uuid  = each.value.smbios_uuid
  disks        = each.value.disks
  ssh_keys     = var.ssh_keys
}
