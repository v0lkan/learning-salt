# topfile kinda also means "highstate" I guess.

base:
  '*minion':
    - apache
  'os_family:debian':
    - match: grain
    - users-and-ssh