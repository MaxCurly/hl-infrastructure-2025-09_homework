Домашнее задание по теме "Виртуализация: Proxmox // ДЗ"

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
cd ../../vms/vm01/
```
5. Запускаем инициализацию terraform провайдера, планирование и создание ресурсов
```
terragrunt init
terragrunt plan
terragrunt apply
```
На вложенных скриншотах отражены основные этапы выполнения ДЗ:

homework-10-1.png: результат выполнения "terragrunt init" при создании резурса cloud-диска

homework-10-2.png: результат выполнения "terragrunt plan" при создании резурса cloud-диска

homework-10-3.png: результат выполнения "terragrunt apply" при создании резурса cloud-диска

homework-10-4.png: наличие скачанного cloud-диска в web-ui proxmox

homework-10-5.png: результат выполнения "terragrunt apply" при создании резурса ВМ

homework-10-6.png: наличие развернутой рабочей ВМ в web-ui proxmox

homework-10-7.png: скриншот подключения по ssh к развернутой ВМ
