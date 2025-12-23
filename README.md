# Vehicle Rental System — Database Design & SQL Queries

## Project Overview

This project contains the **Vehicle Rental System** database designed to demonstrate database schema design, ERD relationships, and SQL query writing skills. In this project, i will define a relational database schema and write SQL queries to answer business questions related to vehicle rentals.

## Database Description

The Vehicle Rental System manages:

- **Users** — System users (Admins & Customers)  
- **Vehicles** — Vehicles available for rent  
- **Bookings** — Customer bookings of vehicles  

### Business Rules
- Each user has a role (Admin or Customer) and unique email.  
- Vehicles have a unique registration number and availability status.  
- Bookings link users and vehicles, with rental start/end dates and status.

## ERD (Entity Relationship Diagram)

**ERD Link:** *https://lucid.app/lucidchart/b6ab14e2-1965-4c61-a582-6fc547a1dc83/edit?invitationId=inv_ee69a085-60f2-42fb-a260-4335bf8277ff&page=0_0#*

- Primary Keys & Foreign Keys  
- One-to-Many: User → Bookings  
- Many-to-One: Bookings → Vehicles  
- Logical One-to-One between booking & each user/vehicle  
- All status fields defined in the schema

## Database Create Queries

### Queries ENUM: 
    CREATE TYPE user_role AS ENUM ('Admin', 'Customer');
    CREATE TYPE vehicle_type AS ENUM ('car', 'bike', 'truck');
    CREATE TYPE vehicle_status AS ENUM ('available', 'rented', 'maintenance');
    CREATE TYPE booking_status AS ENUM ('pending', 'confirmed', 'completed','cancelled');

### Users Table: 
    CREATE TABLE users (
        user_id BIGSERIAL PRIMARY KEY,
        name VARCHAR(100) NOT NULL,
        email VARCHAR(150) UNIQUE NOT NULL,
        password VARCHAR(255) NOT NULL,
        role user_role NOT NULL,
        phone VARCHAR(20)
    );

### vehicles Table: 
    CREATE TABLE vehicles (
        vehicle_id BIGSERIAL PRIMARY KEY,
        name VARCHAR(100) NOT NULL,
        type vehicle_type NOT NULL,
        model VARCHAR(100),
        registration_number VARCHAR(50) UNIQUE NOT NULL,
        rental_price DECIMAL(10,2) NOT NULL,
        status vehicle_status DEFAULT 'available'
    );

### bookings Table
    CREATE TABLE bookings (
        booking_id BIGSERIAL PRIMARY KEY,
        user_id BIGINT NOT NULL,
        vehicle_id BIGINT NOT NULL,
        start_date DATE NOT NULL,
        end_date DATE NOT NULL,
        status booking_status DEFAULT 'pending',
        total_cost DECIMAL(10,2) NOT NULL,

        CONSTRAINT fk_user
            FOREIGN KEY (user_id)
            REFERENCES users(user_id)
            ON DELETE CASCADE,

        CONSTRAINT fk_vehicle
            FOREIGN KEY (vehicle_id)
            REFERENCES vehicles(vehicle_id)
            ON DELETE RESTRICT
    );



