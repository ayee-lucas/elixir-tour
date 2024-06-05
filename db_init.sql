CREATE USER elixirtour WITH SUPERUSER PASSWORD 'elixir_pass' CREATEDB;
CREATE DATABASE elixirtourdb
    WITH
    OWNER = elixirtour
    ENCODING = 'UTF8'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1;