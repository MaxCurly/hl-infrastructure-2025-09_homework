Домашнее задание по теме "Kubernetes-2 // ДЗ"

Данное задание реализовано при помощи использования следующих инструментов:
- terraform v1.13.1 (должен быть у вас установлен)
- terragrunt v0.86.2 (должен быть у вас установлен)
- provider registry.terraform.io/bpg/proxmox v0.82.1 (скачивается при выполнении "terragrunt init")

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
4. Переходим в директорию с ресурсом, описывающим ВМ
```
cd ../../vms/
```
5. Запускаем инициализацию terraform провайдера, планирование и создание ресурсов
```
terragrunt init
terragrunt plan
terragrunt apply
```

Инструкция по настройке ВМ:

2. Переходим в директорию с проектом ansible
```
cd ./ansible/
```
3. Запускаем автоматизацию при помощи ansible для каждой из групп хостов
```
ansible-playbook -i inventories/k3s/main.yml main.yml
```

Absible деплоит кластер k3s (3 мастера и 3 воркера) c распределенным хранилищем longhorn на 3 воркерах, затем разворачивает веб портал (wordpress/apache + mysql). Доступ к порталу осуществляется через ingress traefik. Дополнительно настраивается на внешнем dns сервере dns запись "wordpress.k3s.local" для отработки заголовка "host" на ingress контроллере. Бекап конфигурации кластера делается встроенными средствами k3s (снапшоты etcd) в автоматическом режиме (ссылка на докементацию: https://docs.k3s.io/cli/etcd-snapshot) и дополнительно не дублировался в рамках данного домашнего задания.



На вложенных скриншотах отражены основные этапы выполнения ДЗ:

homework-12-1.png: состояние кластера и основных объектов

homework-12-2.png: веб страница longhorn

homework-12-3.png: веб страница портала
