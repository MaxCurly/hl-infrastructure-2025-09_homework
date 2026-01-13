Домашнее задание по теме "Nginx - балансировка и отказоустойчивость // ДЗ"

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
4. Переходим в директорию с ресурсом, описывающим ВМ c балансировщиком
```
cd ../../vms/lb01/
```
5. Запускаем инициализацию terraform провайдера, планирование и создание ресурсов
```
terragrunt init
terragrunt plan
terragrunt apply
```
6. Переходим в директорию с ресурсом, описывающим ВМ с первым бекендом
```
cd ../app01/
```
7. Запускаем инициализацию terraform провайдера, планирование и создание ресурсов
```
terragrunt init
terragrunt plan
terragrunt apply
```
8. Переходим в директорию с ресурсом, описывающим ВМ со вторым бекендом
```
cd ../app02/
```
9. Запускаем инициализацию terraform провайдера, планирование и создание ресурсов
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
ansible-playbook -i inventories/lb/main.yml main.yml
ansible-playbook -i inventories/app/main.yml main.yml
```
Метод балансировки выбирается между hash и round-robin тем фактом, определена ли переменная "deploy_angie_balance_method" в файле "./ansible/roles/deploy_angie_reverse_proxy/vars/m
ain.yml"- если переменная закоментирована то будет round-robin, если определена то hash


На вложенных скриншотах отражена работа балансировки (для примера была развернут стенд с балансировкой roundrobin):

homework-3-1.png: золотой бекенд

homework-3-2.png: зеленый бекенд 