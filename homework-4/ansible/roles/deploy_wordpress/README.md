Ansible роль "deploy_wordpress"
=========

Данная роль служит для развертывания веб-сервера "nginx+wordpress".

Требования:
-----------

На целевом хосте должны быть установлены пакеты docker.io и docker-compose-v2.

Переменные для роли:
--------------------

| переменная                           | описание                                                 |
|--------------------------------------|----------------------------------------------------------|
| deploy_wordpress_data_src            | рабочая директория для сохранения данных приложений      |
| deploy_wordpress_project_src         | рабочая директория для docker-compose-v2                 |
| deploy_wordpress_nginx_image_version | версия docker обзара nginx, которая будет развернута     |
| deploy_wordpress_image_version       | версия docker обзара wordpress, которая будет развернута |
| deploy_wordpress_db_host             | ip адресс хоста, на котором развернута база данных       |
| deploy_wordpress_db_name             | имя базы данных                                          |
| deploy_wordpress_db_user             | имя пользователя для доступа к базе данных               |
| deploy_wordpress_db_password         | пароль пользователя для доступа к базе данных            |

Информация об авторе:
---------------------

Автор: MaxCurly (Maxim Kudryashov m.v.kudryashov@ya.ru)