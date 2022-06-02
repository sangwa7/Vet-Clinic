/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
    id integer NOT NULL,
    name string NOT NULL,
    date_of_birth date NOT NULL,
    escape_attempts integer NOT NULL,
    neutered boolean NOT NULL,
    weight_kg decimal NOT NULL,
    species string NULL,
);

ALTER TABLE animals ADD species CHAR(40);
