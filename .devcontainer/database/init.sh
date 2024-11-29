#!/usr/bin/env bash

psql -v ON_ERROR_STOP --username "$POSTGRES_USER" --dbname "postgres" <<-EOSQL
  CREATE USER smartbrain WITH PASSWORD 'smart-brain';
  CREATE DATABASE smartbrain;
  GRANT ALL PRIVILEGES ON DATABASE smartbrain TO smartbrain;
  GRANT USAGE ON SCHEMA public TO smartbrain;
  GRANT ALL ON SCHEMA public TO smartbrain;
  GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO smartbrain;
  GRANT ALL PRIVILEGES ON ALL SEQUENCES IN SCHEMA public TO smartbrain;
  ALTER DATABASE smartbrain OWNER TO smartbrain;
EOSQL

psql -v ON_ERROR_STOP=1 --username "smartbrain" --dbname "smartbrain" <<-EOSQL
  CREATE TABLE users (
    id serial PRIMARY KEY,
    name VARCHAR(100),
    email text UNIQUE NOT NULL,
    entries BIGINT DEFAULT 0,
    joined TIMESTAMP NOT NULL
  );
  CREATE TABLE login (
    id serial PRIMARY KEY,
    hash VARCHAR(100),
    email text UNIQUE NOT NULL
  );
EOSQL
