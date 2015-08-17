CREATE DATABASE restfulparks;

\c restfulparks

CREATE TABLE parks (id SERIAL PRIMARY KEY, name VARCHAR(255), state VARCHAR (255), latlong VARCHAR(255), trail_miles numeric, has_campground boolean);
