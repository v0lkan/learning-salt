ubuntu:
  - mynewmaster:
    - make_master: True
    - minion:
      - local_master: True
      - log_level: debug
    grains:
      - cluster: mynewcluster
      - foo: bar
  - newminion1:
    - minion:
      - local_master: True
      - log_level: debug
    grains:
      - cluster: mynewcluster
      - foo: baz
  centos:
    - newminion12
      - minion:
        - local_master: True
        - log_level: debug
      grains:
        - cluster: mynewcluster
        - foo: baz