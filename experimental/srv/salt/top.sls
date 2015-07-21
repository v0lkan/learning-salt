# you can have different top files in each environment;
# however when you run highstate, they will be combined into a single
# top file.

base:
  - 'os_family:debian':
    - match: grain
    - users-and-ssh
webserver:
  - '*minion':
    - apache