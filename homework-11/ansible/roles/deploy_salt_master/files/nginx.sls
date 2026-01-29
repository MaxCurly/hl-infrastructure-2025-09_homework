install_nginx:
  pkg.installed:
    - name: nginx
    - refresh: True

copy_nginx_conf:
  file.managed:
    - name: /etc/nginx/nginx.conf
    - source: salt://nginx.conf
    - user: root
    - group: root
    - mode: 644
    - makedirs: True
    - replace: True

copy_index_html:
  file.managed:
    - name: /var/www/html/index.nginx-debian.html
    - source: salt://index.html
    - user: root
    - group: root
    - mode: 644
    - makedirs: True
    - replace: True

restart_nginx:
  service.running:
    - name: nginx
    - enable: True
    - restart: True
    - require:
      - pkg: install_nginx
      - file: copy_nginx_conf
      - file: copy_index_html
