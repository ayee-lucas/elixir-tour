CREATE USER elixirtour WITH SUPERUSER PASSWORD 'elixirtour' CREATEDB;
CREATE DATABASE elixirtourdb
    WITH
    OWNER = elixirtour
    ENCODING = 'UTF8'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1;