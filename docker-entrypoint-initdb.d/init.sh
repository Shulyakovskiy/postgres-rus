#!/bin/bash

#set -e

#psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
#    CREATE USER someuser;
#    CREATE DATABASE somedatabase;
#    GRANT ALL PRIVILEGES ON DATABASE somedatabase TO someuser;
#EOSQL

#psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "somedatabase" <<-EOSQL
#    CREATE EXTENSION pg_trgm;
#    CREATE EXTENSION rum;
#    CREATE EXTENSION hunspell_ru_ru;
#    CREATE EXTENSION postgis;
#EOSQL
