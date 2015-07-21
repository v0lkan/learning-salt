include:
  - myuser.user

install_git:
  pkg.installed:
    - name: git

clone_dotfiles:
  git.latest:
    - name: git://github.com/v0lkan/dotfiles.git
    - rev: master
    - target: /home/volkan/dotfiles
    - user: volkan
    - submodules: True
    - require:
      - pkg: install_git
      - user: add_user_volkan

install_dotfiles_if_changed:
  cmd.run:
    - name: 'python install.py -y'
    - cwd: '/home/volkan/dotfiles/'
    - user: volkan
    - onchanges:
      - git: clone_dotfiles