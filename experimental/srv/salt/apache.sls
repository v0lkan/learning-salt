install_apache:
  pkg.installed:
    - name: apache2

ensure_apache_running:
  service.running:
    - name: apache2
    - enabled: True
    - require:
      - pkg: install_apache
    - watch:
      - file: sync mod_status.conf
      - file: sync mod_status.load

sync mod_status.conf:
  file.managed:
    - name: /etc/apache2/mods-enabled/mod_status.conf
    - source: salt://mod_status.conf
    - user: root
    - group: root
    - mode: 600

sync mod_status.load:
  file.managed:
    - name: /etc/apache2/mods-enabled/mod_status.load
    - source: salt://mod_status.load
    - user: root
    - group: root
    - mode: 600