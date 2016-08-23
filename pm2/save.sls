{% from "pm2/map.jinja" import pm2 with context %}

include:
  - pm2.install

{% set save_cmd = "pm2 save" %}
{% if pm2.startup.home_path is defined %}
  {% set save_cmd = "PM2_HOME=" ~ pm2.startup.home_path ~ " " ~ save_cmd %}
{% endif %}

save_pm2_processes:
  cmd.run:
    - name: {{ save_cmd }}
    - runas: {{ pm2.user }}
