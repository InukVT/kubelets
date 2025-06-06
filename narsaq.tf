# proxmox_vm_qemu.narsaq:
resource "proxmox_vm_qemu" "narsaq" {
    agent                  = 1
    bios                   = "seabios"
    boot                   = "c"
    bootdisk               = "scsi0"
    ciuser                 = "inuk"
    cores                  = 2
    define_connection_info = false
    force_create           = false
    full_clone             = false
    hotplug                = "network,disk,usb"
    ipconfig0              = "ip=dhcp"
    kvm                    = true
    memory                 = 4096
    name                   = "narsaq"
    onboot                 = true
    protection             = false
    qemu_os                = "other"
    scsihw                 = "virtio-scsi-pci"
    sshkeys                = <<-EOT
        ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCt/gZ2kyCtEbD6gBf3Tqz6h+cou1YiJ1C1yw0MgDIujgbdPs9FBGXGuU0+qb38nKWzy6jhfWqDQ5O1zvuxccswYrL6GRyPjDd/bTX+qqaE6K5MI67LXzVYZvXOx/+pqsLoGYeuYvcj0jevvaUGI2gL4AWf0+/vGARdQHcFcmU5GnEx58DOfHO8aGDAUNG74lMd1djp40lLKH+LUwnCWiRe83hgdVSBGkLaDVYMBSjpM0aPXhp6Y/SnFSrlfqqcQbZ9y1YtmiGZ7eyLvgRj4Klaf4q/Y7j4finzROPPGFs1SZkne3HYhVvsHnE/xW1YmhjDovvcCJpkwPm6NSgnZSgt7t4skVNivootTiEaenG3MgY1QCih+tTZ3M0s0MQXcYu20LL+HSnmIKnUlUjhtR8us45GVl/oXbKWowDi1OE5+bg/0EXqDmdwpW+5gFBo4XvTOjygEwJG+Hai6l8BwacjLET/QxNTORmNoA4Zf/qVd+IXJSeGfqGtF2LmAewcGa6cZ4vq1sZN0ZV4VnK5GdkSTYmvf8rQcfnRd1oa5nKStGl48Sfa907NeIHTj/vSC6sgdPmZi7MndiRWDhYKE33BujGhSbErKZRhOStOATnth+9FthGAnX5tQ53zkYKA6wOynh/p/2j3/RzVPYrXVm+FkSaLCFNSvKB2kiivaAB1BQ== bastian@inuk.blog
    EOT
    tablet                 = true
    target_nodes           = [
        "sv0001",
    ]
    vm_state               = "running"
    vmid                   = 101

    disks {
        ide {
            ide2 {
                cloudinit {
                    storage = "local-lvm"
                }
            }
        }
        scsi {
            scsi0 {
                disk {
                    backup               = true
                    discard              = false
                    emulatessd           = false
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
                    replicate            = true
                    size                 = "17648M"
                    storage              = "local-lvm"
                }
            }
            scsi1 {
                disk {
                    backup               = true
                    discard              = false
                    emulatessd           = false
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
                    replicate            = true
                    size                 = "13824M"
                    storage              = "local-lvm"
                }
            }
        }
    }

    network {
        bridge    = "vmbr0"
        firewall  = false
        id        = 0
        link_down = false
        macaddr   = "bc:24:11:67:79:08"
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
        uuid = "2e502ecf-8300-4fb5-b7b0-b5e0790976fd"
    }
}
