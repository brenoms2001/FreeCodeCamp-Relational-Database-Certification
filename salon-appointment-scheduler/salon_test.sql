CREATE DATABASE salon_test;

CREATE TABLE customers(
    customer_id SERIAL PRIMARY KEY,
    name VARCHAR(50),
    phone VARCHAR(20) UNIQUE
);

CREATE TABLE services(
    service_id SERIAL PRIMARY KEY,
    name VARCHAR(50)
);

CREATE TABLE appointments(
    appointment_id SERIAL PRIMARY KEY,
    customer_id INT,
    FOREIGN KEY(customer_id) REFERENCES customers(customer_id),
    service_id INT,
    FOREIGN KEY(service_id) REFERENCES services(service_id),
    time VARCHAR(25)
);

INSERT INTO services(name) VALUES ('cut'), ('color'), ('perm'), ('style'), ('trim');