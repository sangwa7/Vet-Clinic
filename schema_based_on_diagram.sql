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

/* create invoices table */
CREATE TABLE invoices (
   id INT PRIMARY KEY NOT NULL,
   generated_at TIMESTAMP, 
   payed_at TIMESTAMP, 
   medical_histories_id INT, 
   CONSTRAINT fk_medical_history
	FOREIGN KEY (medical_histories_id)
	REFERENCES medical_histories(id)
);

/* create invoice_items table */
CREATE TABLE invoice_items (
  id INT PRIMARY KEY NOT NULL,
  unit_price NUMERIC, 
  quantity INT, 
  total_price NUMERIC, 
  invoice_id INT, 
  CONSTRAINT fk_invoice
  FOREIGN KEY (invoice_id)
  REFERENCEs invoices(id),
    treatment_id INT, 
	CONSTRAINT fk_treatment
	FOREIGN KEY (treatment_id)
	REFERENCES treatments(id)
);

/* creating a many to many relationship between treatment and medical_history */
CREATE TABLE medical_treatment(
    medical_id INT,
    treatment_id INT,
    CONSTRAINT fk_medical_history FOREIGN KEY(medical_id)
    REFERENCES medical_histories(id),
    CONSTRAINT fk_medical_treatment FOREIGN KEY(treatment_id)
    REFERENCES treatments(id)
);


/* Optimized Execution analysis by creating Indexes */
CREATE INDEX treatment_id_asc ON invoice_items (treatment_id ASC);
CREATE INDEX medical_histories_id_asc ON invoices (medical_histories_id ASC);
CREATE INDEX invoices_asc ON invoice_items (invoice_id ASC);
CREATE INDEX patients_asc ON medical_histories (patient_id ASC);
