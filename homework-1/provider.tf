terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
      version = "0.164.0"
    }
  }
}

provider yandex {
  zone = "ru-central1-a"
}
