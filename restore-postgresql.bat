@echo off

echo "delete wordnet30"
psql -h localhost -U postgres -W template1 -c "DROP DATABASE wordnet30;"
echo "create wordnet30"
psql -h localhost -U postgres -W template1 -f postgres-wordnet30-createdb.sql
echo "schema"
psql -h localhost -U postgres -W wordnet30 -f postgres-wordnet30-schema.sql
echo "data"
psql -h localhost -U postgres -W wordnet30 -f postgres-wordnet30-data.sql
echo "constraints"
psql -h localhost -U postgres -W wordnet30 -f postgres-wordnet30-constraints.sql
