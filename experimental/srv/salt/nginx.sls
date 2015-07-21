pre_check:
  pkg.installed:
    - name: nginx
install_nginx:
  service.running:
    - name: nginx
    - enable: True
    require:
      - pkg: pre_check

