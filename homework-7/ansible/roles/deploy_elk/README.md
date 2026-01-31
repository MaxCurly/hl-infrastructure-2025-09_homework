Ansible роль "deploy_elk"
=========

Данная роль служит для развертывания системы централизованного сбора и алализа логов "ELK".

Требования:
-----------

На целевом хосте должны быть установлены пакеты docker.io и docker-compose-v2.

Переменные для роли:
--------------------

| переменная                             | описание                                                     |
|----------------------------------------|--------------------------------------------------------------|
| deploy_elk_data_src                    | рабочая директория для сохранения данных приложений          |
| deploy_elk_project_src                 | рабочая директория для docker-compose-v2                     |
| deploy_elk_elasticsearch_image_version | версия docker обзара elasticsearch, которая будет развернута |
| deploy_elk_logstash_image_version      | версия docker обзара logstash, которая будет развернута      |
| deploy_elk_kibana_image_version        | версия docker обзара kibana, которая будет развернута        |

Информация об авторе:
---------------------

Автор: MaxCurly (Maxim Kudryashov m.v.kudryashov@ya.ru)