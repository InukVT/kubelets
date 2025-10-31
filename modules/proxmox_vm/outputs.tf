output "vm_id" {
  description = "The VM ID"
  value       = proxmox_vm_qemu.vm.vmid
}

output "vm_name" {
  description = "The VM name"
  value       = proxmox_vm_qemu.vm.name
}

output "mac_address" {
  description = "The MAC address of the VM"
  value       = proxmox_vm_qemu.vm.network[0].macaddr
}

output "cpu_cores" {
  description = "Number of CPU cores"
  value       = proxmox_vm_qemu.vm.cpu[0].cores
}

output "memory_mb" {
  description = "Memory allocated in MB"
  value       = proxmox_vm_qemu.vm.memory
}

output "target_node" {
  description = "Target Proxmox node"
  value       = one(proxmox_vm_qemu.vm.target_nodes)
}
