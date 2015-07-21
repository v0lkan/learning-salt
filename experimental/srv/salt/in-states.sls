ensure_apache:
  service.running:
    - name: apache2
    - enable: True
    - require:
      - pkg: install_apache

# identical:
install_apache:
  pkg.installed:
    - name: apache2
    - require_in:
      - service: ensure_apache