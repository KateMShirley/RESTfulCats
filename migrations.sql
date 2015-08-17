CREATE DATABASE restfulcats;

\c restfulcats

CREATE TABLE cats (id SERIAL PRIMARY KEY, name VARCHAR(255), breed VARCHAR (255));
