#!/usr/bin/env bash

psql -v ON_ERROR_STOP --username "$POSTGRES_USER" --dbname "postgres" <<-EOSQL
  CREATE USER smartbrain WITH PASSWORD 'smart-brain';
  CREATE DATABASE smartbrain;
EOSQL

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "smartbrain" <<-EOSQL
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