Домашнее задание по теме "Распределенные файловые системы: CEPH // ДЗ"

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
cd ./terragrunt/root/proxmox/cloudimg/ubuntu_22.04_jammy_server_cloudimg_amd64_20260219
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
ansible-playbook -i inventories/ceph/main.yml main.yml
ansible-playbook -i inventories/client/main.yml main.yml
```

Расчет pg осуществлялся по формуле ((Target_PGs_per_OSD)x(OSD_#)x(%Data))/(Size), где:
Target_PGs_per_OSD- целевое аол-во pg на osd (для малых кластеров взято значение 100)
OSD_#- кол-во osd в кластере
%Data- процент хранилища, занимаемый пулом
Size- число реплик данных для пула

Для пула rbd: ((100)x(9)x(0.7))/(3)= 210 (ллижайшая степень двойки- 256)
Для пула cephfs_data: ((100)x(9)x(0.3))/(3)= 90 (ллижайшая степень двойки- 128)
Для пула cephfs_metadata: 32 (стандарт для мета-пулов)

При всем при этом в кластере работает pg autoscaler, который зарезал кол-во всех pg до 32


Ниже отражены основные этапы выполнения ДЗ:

homework-14-1.png: состояние кластера ceph после развертывания (ДЗ пункт 1)

homework-14-2.png: подмонтированные блочные устройства и cephfs на трех клиентах (ДЗ пункт 2)

homework-14-3.png: состояние кластера после увеличения кол-ва osd с 9 до 12 (ДЗ пункт 3.4)

homework-14-4.png: состояние кластера после уменьшения кол-ва osd с 12 до 11 (ДЗ пункт 3.5)

https://disk.yandex.ru/i/ZVPS3E1c2QrYPA: демонстрация восстановления работоспособности кластера после splitbrain (splitbrain организовывался путем отключения сети на всех нодах кластера) (ДЗ пункт 3.1)

https://disk.yandex.ru/i/w5ff6RZvPrpVgw: демонстрация восстановления работоспособности кластера после одновременного отключения питания на всех нодах (ДЗ пункт 3.3)

https://disk.yandex.ru/i/-HiORes1jyGk0A: демонстрация замены сбойной ноды в кластере (сбойная нода имела роли: mon, mds, osd) (ДЗ пункт 3.2)