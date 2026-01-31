Ansible роль "deploy_nginx_reverse_proxy"
=========

Данная роль служит для развертывания веб-сервера "nginx" в роли reverse-proxy.

Требования:
-----------

На целевом хосте должны быть установлены пакеты docker.io и docker-compose-v2.

Переменные для роли:
--------------------

| переменная                 | описание                                             |
|----------------------------|------------------------------------------------------|
| deploy_nginx_project_src   | рабочая директория для docker-compose-v2             |
| deploy_nginx_image_version | версия docker обзара nginx, которая будет развернута |

Информация об авторе:
---------------------

Автор: MaxCurly (Maxim Kudryashov m.v.kudryashov@ya.ru)