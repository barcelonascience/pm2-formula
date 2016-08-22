{% from "pm2/map.jinja" import pm2 with context %}

install_pm2:
  npm.installed:
    - name: pm2@{{ pm2.version }}
