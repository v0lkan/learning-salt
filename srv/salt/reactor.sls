remove_marker:
  local.cmd.run:
    - tgt: '*'
    - arg:
      - 'rm /tmp/marker'

  {%if data['tag'] == 'salt/custom/myapp/failure'%}
  run_a_highstate:
    local.state.highstate:
      - tgt: '*'
      - kwarg:
        - pillar:
            trigger_event_tag: {{data['tag']}}
  {%endif%}