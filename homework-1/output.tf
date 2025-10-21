output "external_ip_address" {
  description = "vm external ip address"
  value       = yandex_compute_instance.otus-homework1-vm.network_interface[0].nat_ip_address
}

output "internal_ip_address" {
  description = "vm internal ip address"
  value       = yandex_compute_instance.otus-homework1-vm.network_interface[0].ip_address
}

output "mac_address" {
  description = "vm MAC"
  value       = yandex_compute_instance.otus-homework1-vm.network_interface[0].mac_address
}

output "instance_id" {
  description = "vm id"
  value       = yandex_compute_instance.otus-homework1-vm.id
}

output "instance_name" {
  description = "vm name"
  value       = yandex_compute_instance.otus-homework1-vm.name
}
