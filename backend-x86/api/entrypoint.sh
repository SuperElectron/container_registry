#!/bin/sh

# Setup Python
ln -sf /dev/stdout /api/project/logs/python.log
pip install -r /api/requirements.txt

printf "waiting for cassandra database at %s >> %s" "cassandra" "9042"
# ipAddress=$1 (Database Gateway: use cassandra) & port=$2 (port: use 9042)
while ! nc -z cassandra 9042; do
  printf "waiting for cassandra ..."
  sleep 0.5
done

printf "CassandraApi ready to run\n*****\n"

# Run the application
exec /docker-entrypoint.sh "$@"
