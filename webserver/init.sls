apache2:
  pkg:
    - installed
#  service.running:
#    - require:
#      - pkg: apache2

/var/www/index.html:                            # ID declaration
  file:                                         # state declaration
    - managed                                   # function
    - source: salt://webserver/__index__.html   # function arg
    - require:                                  # requisite declaration
      - pkg: apache2                            # requisite reference
