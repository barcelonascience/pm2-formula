{% from "pm2/map.jinja" import pm2 with context %}

{% for app_name, app in pm2.apps.items() if app.absent is defined and app.absent %}

delete_{{ app_name }}_pm2_process:
  cmd.run:
    - name: pm2 delete {{ app_name }}
    - runas: {{ pm2.user }}
    - onlyif: pm2 describe {{ app_name }}

{% endfor %}
