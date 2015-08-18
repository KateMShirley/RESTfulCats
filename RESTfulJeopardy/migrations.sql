CREATE DATABASE restfuljeopardy;

\c restfuljeopardy

CREATE TABLE jeop (id SERIAL PRIMARY KEY, category VARCHAR(255), value numeric, question VARCHAR(255), answer VARCHAR(255));
