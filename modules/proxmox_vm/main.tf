terraform {
  required_providers {
    proxmox = {
      source  = "telmate/proxmox"
      version = "3.0.2-rc04"
    }
  }
  required_version = ">= 0.14"
}

locals {
  # Map scsi block names to their disk configs
  scsi_blocks = {
    for i, disk in var.disks : "scsi${i}" => disk
  }
}

resource "proxmox_vm_qemu" "vm" {
  agent                  = 1
  bios                   = "seabios"
  boot                   = "c"
  bootdisk               = "scsi0"
  ciuser                 = var.ci_user
  cpu {
    cores  = var.cpu_cores
    numa   = false
    sockets = 1
  }
  define_connection_info = false
  force_create           = false
  full_clone             = false
  hotplug                = "network,disk,usb"
  ipconfig0              = "ip=dhcp"
  kvm                    = true
  memory                 = var.memory_mb
  name                   = var.node_name
  onboot                 = true
  protection             = false
  qemu_os                = "other"
  scsihw                 = "virtio-scsi-pci"
  sshkeys                = var.ssh_keys
  tablet                 = true
  target_nodes           = var.target_nodes
  vm_state               = "running"
  vmid                   = var.vmid

  disks {
    ide {
      ide2 {
        cloudinit {
          storage = "local-lvm"
        }
      }
    }
    scsi {
      dynamic "scsi0" {
        for_each = contains(keys(local.scsi_blocks), "scsi0") ? [local.scsi_blocks.scsi0] : []
        content {
          disk {
            backup               = scsi0.value.backup
            discard              = false
            emulatessd           = scsi0.value.ssd
            format               = "raw"
            iops_r_burst         = 0
            iops_r_burst_length  = 0
            iops_r_concurrent    = 0
            iops_wr_burst        = 0
            iops_wr_burst_length = 0
            iops_wr_concurrent   = 0
            iothread             = false
            mbps_r_burst         = 0
            mbps_r_concurrent    = 0
            mbps_wr_burst        = 0
            mbps_wr_concurrent   = 0
            readonly             = false
            replicate            = scsi0.value.replicate
            size                 = scsi0.value.size
            storage              = "local-lvm"
          }
        }
      }
      dynamic "scsi1" {
        for_each = contains(keys(local.scsi_blocks), "scsi1") ? [local.scsi_blocks.scsi1] : []
        content {
          disk {
            backup               = scsi1.value.backup
            discard              = false
            emulatessd           = scsi1.value.ssd
            format               = "raw"
            iops_r_burst         = 0
            iops_r_burst_length  = 0
            iops_r_concurrent    = 0
            iops_wr_burst        = 0
            iops_wr_burst_length = 0
            iops_wr_concurrent   = 0
            iothread             = false
            mbps_r_burst         = 0
            mbps_r_concurrent    = 0
            mbps_wr_burst        = 0
            mbps_wr_concurrent   = 0
            readonly             = false
            replicate            = scsi1.value.replicate
            size                 = scsi1.value.size
            storage              = "local-lvm"
          }
        }
      }
      dynamic "scsi2" {
        for_each = contains(keys(local.scsi_blocks), "scsi2") ? [local.scsi_blocks.scsi2] : []
        content {
          disk {
            backup               = scsi2.value.backup
            discard              = false
            emulatessd           = scsi2.value.ssd
            format               = "raw"
            iops_r_burst         = 0
            iops_r_burst_length  = 0
            iops_r_concurrent    = 0
            iops_wr_burst        = 0
            iops_wr_burst_length = 0
            iops_wr_concurrent   = 0
            iothread             = false
            mbps_r_burst         = 0
            mbps_r_concurrent    = 0
            mbps_wr_burst        = 0
            mbps_wr_concurrent   = 0
            readonly             = false
            replicate            = scsi2.value.replicate
            size                 = scsi2.value.size
            storage              = "local-lvm"
          }
        }
      }
      dynamic "scsi3" {
        for_each = contains(keys(local.scsi_blocks), "scsi3") ? [local.scsi_blocks.scsi3] : []
        content {
          disk {
            backup               = scsi3.value.backup
            discard              = false
            emulatessd           = scsi3.value.ssd
            format               = "raw"
            iops_r_burst         = 0
            iops_r_burst_length  = 0
            iops_r_concurrent    = 0
            iops_wr_burst        = 0
            iops_wr_burst_length = 0
            iops_wr_concurrent   = 0
            iothread             = false
            mbps_r_burst         = 0
            mbps_r_concurrent    = 0
            mbps_wr_burst        = 0
            mbps_wr_concurrent   = 0
            readonly             = false
            replicate            = scsi3.value.replicate
            size                 = scsi3.value.size
            storage              = "local-lvm"
          }
        }
      }
    }
  }

  network {
    bridge    = "vmbr0"
    firewall  = false
    id        = 0
    link_down = false
    macaddr   = var.mac_address
    model     = "virtio"
    mtu       = 0
    queues    = 0
    rate      = 0
    tag       = 0
  }

  serial {
    id   = 0
    type = "socket"
  }

  smbios {
    uuid = var.smbios_uuid
  }
}
