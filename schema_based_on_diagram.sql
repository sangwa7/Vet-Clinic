/* CREATE TABLES BASED ON DIAGRAM */

/* create patients table */
CREATE TABLE patients ( 
    id INT PRIMARY KEY NOT NULL, 
    name VARCHAR(25) NOT NULL, 
    date_of_birth DATE NOT NULL 
    );

/* create medical_histories table */
CREATE TABLE medical_histories (
	id INT PRIMARY KEY NOT NULL, 
	patient_id INT, 
    CONSTRAINT fk_patient
  	FOREIGN KEY(patient_id)
  		REFERENCES patients(id)
);

/* create treatments table */
CREATE TABLE treatments (
	  id INT PRIMARY KEY NOT NULL,
	   type VARCHAR(255), 
	   name VARCHAR(255)
);
