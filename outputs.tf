output "nodes" {
  description = "Summary of all Kubernetes nodes"
  value = {
    for name, module in module.kubernetes_nodes : name => {
      vmid        = module.vm_id
      name        = module.vm_name
      mac_address = module.mac_address
      cpu_cores   = module.cpu_cores
      memory_mb   = module.memory_mb
      target_node = module.target_node
    }
  }
}

output "node_names" {
  description = "List of all node names"
  value       = [for name in keys(var.nodes) : name]
}

output "node_vmids" {
  description = "Map of node names to their VM IDs"
  value = {
    for name, module in module.kubernetes_nodes : name => module.vm_id
  }
}
