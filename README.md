# Vehicle Rental System – Database Design & SQL Queries

## Project Overview

This project is part of the **Level 2 Web Development – Database Assignment**.  
The objective of this assignment is to demonstrate understanding of:

- Relational Database Design  
- Entity Relationship Diagram (ERD)  
- SQL Queries using JOIN, WHERE, GROUP BY, HAVING, and Subqueries  

The system represents a **Vehicle Rental System**, where customers can book vehicles and administrators can manage vehicles and bookings.

## Database Tables Overview

### Users
Stores system users (Admin & Customer).

- `user_id` (Primary Key)
- `name`
- `email` (unique)
- `password`
- `phone`
- `role` (Admin, Customer)

---

### 🔹 Vehicles
Stores information about rental vehicles.

- `vehicle_id` (Primary Key)
- `name`
- `type` (car, bike, truck)
- `model`
- `registration_number` (unique)
- `rental_price`
- `status` (available, rented, maintenance)

---

### 🔹 Bookings
Stores booking information.

- `booking_id` (Primary Key)
- `user_id` (Foreign Key → users)
- `vehicle_id` (Foreign Key → vehicles)
- `start_date`
- `end_date`
- `status` (pending/confirmed/completed/cancelled)
- `total_cost`

---

## Entity Relationship Diagram (ERD)

**ERD Link:**  
*https://lucid.app/lucidchart/b6ab14e2-1965-4c61-a582-6fc547a1dc83/edit?invitationId=inv_ee69a085-60f2-42fb-a260-4335bf8277ff&page=0_0#*

### Relationships:
- One User can have many Bookings (1 → Many)
- One Vehicle can have many Bookings (1 → Many)
- Each Booking belongs to one User and one Vehicle

## SQL Queries Explanation

### 🔹 Query 1: Retrieve Booking Information with Customer and Vehicle Details (JOIN)

**Purpose:**  
To display booking details along with the customer name and vehicle name.

**Explanation:**  
- `bookings` is used as the main table  
- `users` table is joined using `user_id` to get customer details  
- `vehicles` table is joined using `vehicle_id` to get vehicle details  
- `INNER JOIN` ensures only matching records are shown

### Query 2: Find Vehicles That Have Never Been Booked (NOT EXISTS)

**Purpose:**  
To identify vehicles that have never been booked.

**Explanation:**  
- Selects all vehicles from the `vehicles` table  
- Uses a subquery with `NOT EXISTS` to check whether the vehicle appears in the `bookings` table  
- If no matching booking exists, the vehicle is returned

### Query 3: Retrieve Available Vehicles of a Specific Type (WHERE)

**Purpose:**  
To retrieve vehicles that are currently available and belong to a specific type (e.g., car).

**Explanation:**  
- Uses the `WHERE` clause to filter rows  
- Filters vehicles where:
  - `status = 'available'`
  - `type = 'car'`  

### Query 4: Find Vehicles with More Than 2 Bookings (GROUP BY & HAVING)

**Purpose:**  
To find vehicles that have been booked more than two times.

**Explanation:**  
- Joins `vehicles` and `bookings` tables using `vehicle_id`  
- Groups records by vehicle  
- Uses `COUNT()` to calculate total bookings per vehicle  
- `HAVING` filters grouped results where booking count is greater than 2 
