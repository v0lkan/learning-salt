base:
  '*':
    - myuser.users
    - myuser.dotfiles
  'os_family:debian':
    - match: grain
    - users_and_ssh

webserver:
  '*minion':
    - apache