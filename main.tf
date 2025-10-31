terraform {
  required_providers {
    proxmox = {
      source  = "telmate/proxmox"
      version = "3.0.2-rc04"
    }
  }

  required_version = ">= 0.14"
}

provider "proxmox" {
  pm_api_url      = "https://nano01.rhino-dorian.ts.net:8006/api2/json"
  pm_user         = "root@pam"
  pm_password     = var.pm_password
  pm_tls_insecure = true
}

