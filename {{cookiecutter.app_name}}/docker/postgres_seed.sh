#!/bin/bash

DATABASE_NAME="eventador_admin"
DATABASE_USER="eventador_admin"
DB_DATA_LOCATION="./eventador.sql"

echo "*** CREATING DATABASE ***"

psql -h postgresdb -U postgres -q <<EOSQL
    DROP ROLE IF EXISTS $DATABASE_USER;
    CREATE ROLE $DATABASE_USER WITH LOGIN PASSWORD '$DATABASE_PASS';
    CREATE DATABASE "$DATABASE_NAME" ENCODING 'UTF-8' OWNER $DATABASE_USER;
EOSQL

echo "*** DATABASE CREATED ***"

echo "*** POPULATING DATABASE ***"

psql -h postgresdb -U postgres -q "$DATABASE_NAME" < "$DB_DATA_LOCATION";

psql -h postgresdb -U postgres -q <<EOSQL
    alter user $DATABASE_USER with SUPERUSER;
    GRANT ALL ON DATABASE "$DATABASE_NAME" TO $DATABASE_USER;
    grant all privileges on all tables in schema public to eventador_admin;
    grant all privileges on all sequences in schema public to eventador_admin;
    grant all privileges on all functions in schema public to eventador_admin;
EOSQL
echo "*** DATABASE POPULATED ***"