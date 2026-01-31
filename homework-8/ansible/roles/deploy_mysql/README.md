Ansible роль "deploy_mysql"
=========

Данная роль служит для развертывания базы данных "mysql".

Требования:
-----------

На целевом хосте должны быть установлены пакеты docker.io и docker-compose-v2.

Переменные для роли:
--------------------

| переменная                 | описание                                                             |
|----------------------------|----------------------------------------------------------------------|
| deploy_mysql_root_pass     | пароль root пользователя для mysql                                   |
| deploy_mysql_data_src      | рабочая директория для сохранения данных приложений                  |
| deploy_mysql_project_src   | рабочая директория для docker-compose-v2                             |
| deploy_mysql_image_version | версия docker обзара mysql, которая будет развернута                 |
| deploy_PyMySQL_ver         | версия пекета PyMySQL, которая будет установлена                     |
| deploy_sql_master_ip       | ip адресс основного сервера базы данных                              |
| deploy_sql_slave_ip        | ip адресс второстипенного сервера базы данных                        |
| deploy_mysql_replica_user  | пользователь mysql, используемый для master-slave репликации         |
| deploy_mysql_replica_pass  | пароль пользователя mysql, используемого для master-slave репликации |
| deploy_mysql_db_name       | имя базы данных                                                      |
| deploy_mysql_db_user       | имя пользователя для доступа к базе данных                           |
| deploy_mysql_db_password   | пароль пользователя для доступа к базе данных                        |

Информация об авторе:
---------------------

Автор: MaxCurly (Maxim Kudryashov m.v.kudryashov@ya.ru)