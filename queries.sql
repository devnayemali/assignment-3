

SELECT
    b.booking_id AS booking_id,
    u.name AS customer_name,
    v.name AS vehicle_name,
    b.start_date,
    b.end_date,
    b.status,
    b.total_cost
FROM bookings as b
INNER JOIN users as u ON b.user_id = u.user_id
INNER JOIN vehicles as v ON b.vehicle_id = v.vehicle_id;


SELECT
    v.vehicle_id,
    v.name,
    v.type,
    v.model,
    v.registration_number,
    v.rental_price,
    v.status
FROM vehicles v
WHERE NOT EXISTS (
    SELECT 1
    FROM bookings b
    WHERE b.vehicle_id = v.vehicle_id
);


SELECT
    vehicle_id,
    name,
    type,
    model,
    registration_number,
    rental_price,
    status
FROM vehicles
WHERE status = 'available'
  AND type = 'car';


SELECT 
  v.vehicle_id, 
  v.name, 
  COUNT(b.booking_id) AS total_bookings 
FROM vehicles v
JOIN bookings b ON 
  v.vehicle_id = b.vehicle_id
GROUP BY v.vehicle_id, v.name
HAVING COUNT(b.booking_id) > 2;