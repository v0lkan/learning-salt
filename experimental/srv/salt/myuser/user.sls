install_zsh:
  pkg.installed:
    - name: zsh

add_user_volkan:
  user.present:
    - name: volkan
    - shell: /bin/zsh
    - require:
      - pkg: install_zsh