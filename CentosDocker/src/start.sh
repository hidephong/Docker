#!/bin/bash
#sudo -u ${USERNAME} normal_command_1
#root_command_1
#root_command_2
#sudo -u ${USERNAME} normal_command_2
# etc.

exec redis-server &

echo "Starting ArrowJS server..."

exec pm2 start server.js &

echo "/opt"

cd /opt

echo "Starting PostgreSQL server..."

exec su - postgres -c "/usr/pgsql-9.4/bin/pg_ctl -D /var/lib/pgsql/9.4/data -l /var/lib/pgsql/9.4/logfile start"

exec su - postgres -c "createdb green_project postgres"

exec su - postgres -c "psql green_project < green.sql"

exec su - postgres

exec psql --command "alter role postgres with password '123456';"

echo "Success"
