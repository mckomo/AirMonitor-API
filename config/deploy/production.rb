# server-based syntax
# ======================
# Defines a single server with a list of roles and multiple properties.
# You can define all roles on a single server, or split them:
server 'air-monitor.pl', user: 'mckomo', roles: %w{app db web}

set :deploy_to, '/var/www/air-monitor-api'