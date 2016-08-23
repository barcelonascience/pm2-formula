{% from "pm2/map.jinja" import pm2 with context %}

include:
  - pm2.install

save_pm2_processes:
  cmd.run:
    - name: pm2 save
    - runas: {{ pm2.user }}
