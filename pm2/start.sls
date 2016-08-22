{% from "pm2/map.jinja" import pm2 with context %}

include:
  - pm2

{% for app_name, app in pm2.apps.items() %}

{% set start_cmd = { 'value':"pm2 start " ~ app.main_file ~ " --name=" ~ app_name } %}
{% for option, value in app.get('options', {}).items() %}
  {% if start_cmd.update({ 'value': start_cmd['value'] ~ " --" ~ option ~ "=" ~ value }) %}
  {% endif %}
{% endfor %}
{% if app.args is defined %}
  {% if start_cmd.update({ 'value': start_cmd['value'] ~ " -- " ~ app.args|join(" ") }) %}
  {% endif %}
{% endif %}

start_{{ app_name }}_pm2_process:
  cmd.run:
    - name: {{ start_cmd['value'] }}
    - runas: {{ pm2.user }}

{% endfor %}
