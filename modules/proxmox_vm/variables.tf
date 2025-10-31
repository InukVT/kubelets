variable "ci_user" {
  description = "Cloud-init user"
  type        = string
  default     = "inuk"
}

variable "cpu_cores" {
  description = "Number of CPU cores"
  type        = number
}

variable "disks" {
  description = "List of SCSI disks to attach to the VM"
  type = list(object({
    size       = string
    ssd        = optional(bool, true)
    backup     = optional(bool, true)
    replicate  = optional(bool, true)
  }))

  validation {
    condition     = length(var.disks) >= 2
    error_message = "VM must have at least 2 disks."
  }

  validation {
    condition     = length(var.disks) <= 4
    error_message = "VM can have at most 4 disks."
  }
}

variable "mac_address" {
  description = "MAC address for the VM"
  type        = string
}

variable "memory_mb" {
  description = "Memory in MB"
  type        = number
}

variable "node_name" {
  description = "Name of the node"
  type        = string
}

variable "smbios_uuid" {
  description = "SMBIOS UUID for the VM"
  type        = string
}

variable "ssh_keys" {
  description = "SSH public keys for cloud-init"
  type        = string
}

variable "target_nodes" {
  description = "Proxmox nodes to target"
  type        = list(string)
}

variable "vmid" {
  description = "Proxmox VM ID"
  type        = number
}
