output "vm_info" {
  value = {
    vm_id          = proxmox_virtual_environment_vm.vm.id
    vm_name        = proxmox_virtual_environment_vm.vm.name
    node           = proxmox_virtual_environment_vm.vm.node_name
    cpu            = proxmox_virtual_environment_vm.vm.cpu[0].cores
    memory         = proxmox_virtual_environment_vm.vm.memory[0].dedicated
    maindisk       = proxmox_virtual_environment_vm.vm.disk[0].size
#    ipv4_addresses = proxmox_virtual_environment_vm.vm.ipv4_addresses[1][0]
#    mac_addresses  = proxmox_virtual_environment_vm.vm.mac_addresses[1]
  }
}
