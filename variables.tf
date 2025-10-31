variable "pm_password" {
  description = "Password for accessing Proxmox"
  type        = string
  sensitive   = true
}

variable "ssh_keys" {
  description = "SSH public keys for cloud-init"
  type        = string
  default     = <<-EOT
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCt/gZ2kyCtEbD6gBf3Tqz6h+cou1YiJ1C1yw0MgDIujgbdPs9FBGXGuU0+qb38nKWzy6jhfWqDQ5O1zvuxccswYrL6GRyPjDd/bTX+qqaE6K5MI67LXzVYZvXOx/+pqsLoGYeuYvcj0jevvaUGI2gL4AWf0+/vGARdQHcFcmU5GnEx58DOfHO8aGDAUNG74lMd1djp40lLKH+LUwnCWiRe83hgdVSBGkLaDVYMBSjpM0aPXhp6Y/SnFSrlfqqcQbZ9y1YtmiGZ7eyLvgRj4Klaf4q/Y7j4finzROPPGFs1SZkne3HYhVvsHnE/xW1YmhjDovvcCJpkwPm6NSgnZSgt7t4skVNivootTiEaenG3MgY1QCih+tTZ3M0s0MQXcYu20LL+HSnmIKnUlUjhtR8us45GVl/oXbKWowDi1OE5+bg/0EXqDmdwpW+5gFBo4XvTOjygEwJG+Hai6l8BwacjLET/QxNTORmNoA4Zf/qVd+IXJSeGfqGtF2LmAewcGa6cZ4vq1sZN0ZV4VnK5GdkSTYmvf8rQcfnRd1oa5nKStGl48Sfa907NeIHTj/vSC6sgdPmZi7MndiRWDhYKE33BujGhSbErKZRhOStOATnth+9FthGAnX5tQ53zkYKA6wOynh/p/2j3/RzVPYrXVm+FkSaLCFNSvKB2kiivaAB1BQ== bastian@inuk.blog
EOT
}

variable "nodes" {
  description = "Map of Kubernetes node configurations"
  type = map(object({
    vmid         = number
    cpu_cores    = number
    memory_mb    = number
    target_nodes = list(string)
    mac_address  = string
    smbios_uuid  = string
    disks = list(object({
      size       = string
      ssd        = optional(bool, true)
      backup     = optional(bool, true)
      replicate  = optional(bool, true)
    }))
  }))

  default = {
    nuuk = {
      vmid         = 100
      cpu_cores    = 4
      memory_mb    = 6144
      target_nodes = ["nano01"]
      mac_address  = "bc:24:11:38:a7:81"
      smbios_uuid  = "64d36c30-5341-4fdb-86f3-ca50ad858c1a"
      disks = [
        { size = "24064M", ssd = true, backup = true, replicate = true },
        { size = "32G", ssd = true, backup = true, replicate = true },
        { size = "13824M", ssd = false, backup = true, replicate = true },
      ]
    }
    ilulissat = {
      vmid         = 106
      cpu_cores    = 4
      memory_mb    = 6144
      target_nodes = ["tiny01"]
      mac_address  = "bc:24:11:08:92:bd"
      smbios_uuid  = "4b752b3f-f7d6-437d-bdc6-f56ad6c5bc1c"
      disks = [
        { size = "24064M", ssd = true, backup = true, replicate = true },
        { size = "64G", ssd = true, backup = true, replicate = true },
        { size = "8G", ssd = true, backup = true, replicate = true },
      ]
    }
    qaqortoq = {
      vmid         = 107
      cpu_cores    = 4
      memory_mb    = 6144
      target_nodes = ["sv0001"]
      mac_address  = "bc:24:11:5b:8a:9a"
      smbios_uuid  = "53b83f56-8c40-498e-a1c9-f853b0695c58"
      disks = [
        { size = "24064M", ssd = true, backup = true, replicate = true },
        { size = "52G", ssd = true, backup = true, replicate = true },
        { size = "8G", ssd = true, backup = true, replicate = true },
        { size = "12G", ssd = true, backup = true, replicate = true },
      ]
    }
    narsaq = {
      vmid         = 101
      cpu_cores    = 2
      memory_mb    = 4096
      target_nodes = ["sv0001"]
      mac_address  = "bc:24:11:67:79:08"
      smbios_uuid  = "2e502ecf-8300-4fb5-b7b0-b5e0790976fd"
      disks = [
        { size = "17648M", ssd = false, backup = true, replicate = true },
        { size = "13824M", ssd = false, backup = true, replicate = true },
      ]
    }
    aasiaat = {
      vmid         = 103
      cpu_cores    = 2
      memory_mb    = 4096
      target_nodes = ["tiny01"]
      mac_address  = "bc:24:11:4d:e3:59"
      smbios_uuid  = "330aff9d-ff7b-4a41-9a7e-0a1edaff3ae5"
      disks = [
        { size = "13824M", ssd = false, backup = true, replicate = true },
        { size = "13824M", ssd = false, backup = true, replicate = true },
      ]
    }
  }
}
