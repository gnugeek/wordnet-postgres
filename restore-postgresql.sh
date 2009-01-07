#!/bin/bash
# bbou@ac-toulouse;fr
# 2007-02-22 17:00

db='wordnet30'
dbtype=postgresql
dbuser=postgres

echo "restoring ${db}"
if [ -z "$1" ]; then
	read -s -p "enter ${dbuser}'s password: " PGPASSWORD
	echo
	export PGPASSWORD
else
	PGPASSWORD=$1
	shift
fi

echo "delete ${db}"
psql -h localhost -U ${dbuser} template1 -c "DROP DATABASE ${db};"
echo "create ${db}"
psql -h localhost -U ${dbuser} template1 -f ${dbtype}-${db}-createdb.sql
echo "schema"
psql -h localhost -U ${dbuser} ${db} -f ${dbtype}-${db}-schema.sql
echo "data"
psql -h localhost -U ${dbuser} ${db} -f ${dbtype}-${db}-data.sql
echo "constraints"
psql -h localhost -U ${dbuser} ${db} -f ${dbtype}-${db}-constraints.sql
