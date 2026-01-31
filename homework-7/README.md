Домашнее задание по теме "Альтернативные балансировщики: envoy, traefik // ДЗ"

Данное задание реализовано при помощи использования следующих инструментов:
- terraform v1.13.1 (должен быть у вас установлен)
- terragrunt v0.86.2 (должен быть у вас установлен)
- provider registry.terraform.io/bpg/proxmox v0.82.1 (скачивается при выполнении "terragrunt init")
- ansible v2.18.8 (должен быть у вас установлен)

Создание ВМ происходит при помощи terragrunt в роли враппера над terraform. ВМ создается в два этапа:
- Загрузка cloud-диска c с репозитория ubuntu
- Создание ВМ с импортом загруженного cloud-диска (при развертывании ВМ отрабатывает cloud-init)

Инструкция по созданию ВМ:

1. Необходимо сделать экспорт учетных данных для подключения к proxmox в переменные среды:
```
export PROXMOX_VE_API_TOKEN='username@realm!tokenid=xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx'
```
```
export PROXMOX_VE_SSH_USERNAME='username@realm'
```
```
export PROXMOX_VE_SSH_PASSWORD='a-strong-password'
```
2. Переходим в директорию с ресурсом, описывающим cloud-диск
```
cd ./terragrunt/root/proxmox/cloudimg/ubuntu_24.04_noble_server_cloudimg_amd64_20260108
```
3. Запускаем инициализацию terraform провайдера, планирование и создание ресурса
```
terragrunt init
terragrunt plan
terragrunt apply
```
4. Переходим в директорию с ресурсами, описывающими виртуальные машины
```
cd ../../vms/
```
5. Запускаем инициализацию terraform провайдера, планирование и создание ресурсов
```
terragrunt init -all
terragrunt plan -all
terragrunt apply -all
```


Инструкция по настройке ВМ:

2. Переходим в директорию с проектом ansible
```
cd ./ansible/
```
3. Запускаем автоматизацию при помощи ansible для каждой из групп хостов
```
ansible-playbook -i inventories/db/main.yml main.yml --ask-vault-pass
ansible-playbook -i inventories/lb/main.yml main.yml --ask-vault-pass
ansible-playbook -i inventories/target/main.yml main.yml --ask-vault-pass
ansible-playbook -i inventories/node/main.yml main.yml --ask-vault-pass
ansible-playbook -i inventories/log/main.yml main.yml --ask-vault-pass
```


На вложенных скриншотах отражена работа кдастера elasticsearch:

homework-7-1.png: webui kibana, демонстрирующий поступление логов

homework-7-2.png: состояние кластера elasticsearch