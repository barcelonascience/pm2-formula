{% from "pm2/map.jinja" import pm2 with context %}

{% set startup_cmd = "pm2 startup " ~ pm2.startup.platform ~ " --user=" ~ pm2.user %}
{% if pm2.startup.home_path is defined %}
  {% set startup_cmd = startup_cmd ~ " --hp=" ~ pm2.startup.home_path %}
{% endif %}

include:
  - pm2

create_pm2_startup_script:
  cmd.run:
    - name: {{ startup_cmd }}
