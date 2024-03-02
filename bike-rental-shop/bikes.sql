CREATE DATABASE bikes();

CREATE TABLE bikes(
    bike_id SERIAL PRIMARY KEY,
    type VARCHAR(50) NOT NULL,
    size INT NOT NULL,
    available BOOLEAN NOT NULL DEFAULT TRUE
);

CREATE TABLE customers(
    customer_id SERIAL PRIMARY KEY,
    phone VARCHAR(15) NOT NULL UNIQUE,
    phone VARCHAR(15) NOT NULL UNIQUE,
    name VARCHAR(40) NOT NULL
);

CREATE TABLE rentals(
    rental_id SERIAL PRIMARY KEY,
    ADD COLUMN customer_id INT NOT NULL,
    FOREIGN KEY(customer_id) REFERENCES customers(customer_id),
    bike_id INT NOT NULL,
    FOREIGN KEY(bike_id) REFERENCES bikes(bike_id),
    date_rented DATE NOT NULL DEFAULT NOW()
    date_returned DATE
);