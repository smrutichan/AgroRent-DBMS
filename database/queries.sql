INSERT INTO Users (name,email,password,phone,role,location) VALUES
('Ravi Kumar','ravi@gmail.com','pass123','9876543210','Farmer','Thanjavur'),
('Suresh Agro','suresh@gmail.com','pass123','9876543211','EquipmentOwner','Coimbatore'),
('Admin Raj','admin@gmail.com','pass123','9876543212','Administrator','Chennai');


INSERT INTO Farmer VALUES
(1,'Thanjavur, Tamil Nadu');

INSERT INTO EquipmentOwner VALUES
(2,'Suresh Farm Machinery');

INSERT INTO Administrator VALUES
(3,2);

INSERT INTO Equipment (name,description,price_per_day,status,category,owner_id) VALUES
('Tractor','Heavy duty tractor for ploughing',1500,'Available','Machinery',2),
('Seed Drill','Automatic seed planting machine',700,'Available','Planting Equipment',2);

INSERT INTO Booking (booking_date,start_date,end_date,status,farmer_id,equipment_id)
VALUES
('2026-03-10','2026-03-12','2026-03-14','Confirmed',1,1);

INSERT INTO Payment (amount,payment_method,booking_id)
VALUES
(3000,'UPI',1);


INSERT INTO EquipmentReview (rating,comment,farmer_id,equipment_id)
VALUES
(5,'Very good tractor',1,1);






SELECT * FROM Users;
SELECT * FROM Equipment;
SELECT * FROM Booking;
SELECT * FROM Payment;
SELECT * FROM EquipmentReview;

SELECT U.name AS Farmer,
E.name AS Equipment,
B.start_date,
B.end_date,
B.status
FROM Booking B
JOIN Farmer F ON B.farmer_id = F.farmer_id
JOIN Users U ON F.farmer_id = U.user_id
JOIN Equipment E ON B.equipment_id = E.equipment_id;

SELECT E.name AS Equipment,
E.category,
E.price_per_day,
U.name AS Owner
FROM Equipment E
JOIN EquipmentOwner EO ON E.owner_id = EO.owner_id
JOIN Users U ON EO.owner_id = U.user_id;

UPDATE Equipment
SET price_per_day = 1600
WHERE equipment_id = 1;


UPDATE Booking
SET status = 'Completed'
WHERE booking_id = 1;

DELETE FROM EquipmentReview
WHERE review_id = 1;

DELETE FROM Booking
WHERE booking_id = 2;

SELECT COUNT(*) AS Total_Equipment
FROM Equipment;

SELECT AVG(price_per_day) AS Average_Price
FROM Equipment;

SELECT SUM(amount) AS Total_Revenue
FROM Payment;

SELECT * 
FROM Users
WHERE name LIKE 'R%';

SELECT * 
FROM Equipment
WHERE description LIKE '%tractor%';



SELECT * 
FROM Booking
WHERE start_date BETWEEN '2026-03-10' AND '2026-03-20';

SELECT name, price_per_day
FROM Equipment
WHERE category IN ('Machinery','Planting Equipment')
AND price_per_day BETWEEN 500 AND 2000;

SELECT * 
FROM Equipment
ORDER BY price_per_day DESC;

SELECT name, role
FROM Users
ORDER BY name;

SELECT booking_id, SUM(amount) AS total_payment
FROM Payment
GROUP BY booking_id;

SELECT role, COUNT(*) AS total_users
FROM Users
GROUP BY role
HAVING COUNT(*) > 1;
