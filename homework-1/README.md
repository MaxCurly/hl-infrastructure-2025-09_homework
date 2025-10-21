Домашнее задание по теме "Практическое занятие по использованию Terraform // ДЗ"

- Файл main.tf - основной манифест создания ресурсов (ВМ, сеть, подсеть).
- Файл provider.tf - манифест с настройками провайдера.
- Файл output.tf - манифест с выводом информации о ресурсе после создания.
- Файл homework1-1.png - скриншот с результатом создания ресурсов и выводом ip адресов ВМ.
- Файл homework1-2.png - скриншот с результатом подключения к созданной ВМ через ssh.


Запуск стенда (yc клиент должен быть сконфигурирован и вы должны быть в нем авторизованы):

export YC_TOKEN=$(yc iam create-token --impersonate-service-account-id ACCOUNT-TOKEN), где ACCOUNT-TOKEN- токен для вашего аккаунта
export YC_CLOUD_ID=$(yc config get cloud-id)
export YC_FOLDER_ID=$(yc config get folder-id)
terraform init
terraform plan
terraform apply
