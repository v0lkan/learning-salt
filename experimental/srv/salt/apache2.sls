{%set os_family = grains['os_family']%}
install apache:
  pkg.installed:
{%if os_family == 'Debian'%}
    - name: apache2
{%elif os_family == 'RedHat'%}
    - name: httpd
{%endif%}

make sure apache is running:
  service.running:
{%if os_family == 'Debian'%}
    - name: apache2
{%elif os_family == 'RedHat'%}
    - name: httpd
{%endif%}
    - enable: True
    - require:
      - pkg: install apache
    - watch:
      - file: sync mod_status.conf
{%if os_family == 'Debian'%}
      - file: sync mod_status.load
{%endif%}

sync mod_status.conf:
  file.managed:
{%if os_family == 'Debian'%}
    - name: /etc/apache2/mods-enabled/mod_status.conf
{%elif os_family == 'RedHat'%}
    - name: /etc/httpd/conf.d/mod_status.conf
{%endif%}
    - source: salt://mod_status.conf
    - user: root
    - group: root
    - mode: 600

{%if os_family == 'Debian'%}
sync mod_status.load:
  file.managed:
    - name: /etc/apache2/mods-enabled/mod_status.load
    - source: salt://mod_status.load
    - user: root
    - group: root
    - mode: 600
{%endif%}
