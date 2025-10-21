resource "yandex_vpc_network" "otus-homework1-net" {
  name = "otus-homework1-net"
}

resource "yandex_vpc_subnet" "otus-homework1-subnet" {
  v4_cidr_blocks = ["192.168.0.0/24"]
  network_id     = yandex_vpc_network.otus-homework1-net.id
}

resource "yandex_compute_instance" "otus-homework1-vm" {
  name        = "otus-homework1-vm"
  description = "otus-homework1-vm"
  platform_id = "standard-v2"
  resources {
    cores         = 2
    core_fraction = 5
    memory        = 1
  }

scheduling_policy {
    preemptible = true
}

  boot_disk {
    initialize_params {
        name     = "otus-homework1_boot-disk"
        image_id = "fd859qni7kigm2cmba8u"
        type     = "network-hdd"
        size     = "10"
    }
  }

  network_interface {
    index     = 1
    subnet_id = yandex_vpc_subnet.otus-homework1-subnet.id
    nat       = true
  }

  metadata = {
    user-data = <<-EOF
      #cloud-config
      users:
        - name: user
          groups: sudo
          shell: /bin/bash
          sudo: ['ALL=(ALL) NOPASSWD:ALL']
          ssh-authorized-keys:
            - ${file("~/.ssh/id_ed25519.pub")}
      EOF
  }
}
