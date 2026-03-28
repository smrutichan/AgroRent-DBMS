ALTER TABLE Users
ADD location VARCHAR(100);

ALTER TABLE Users
MODIFY phone VARCHAR(20);


ALTER TABLE Equipment
ADD category VARCHAR(50);

ALTER TABLE Equipment
RENAME COLUMN availability_status TO status;

ALTER TABLE Booking
ADD CONSTRAINT check_booking_status
CHECK (status IN ('Pending','Confirmed','Completed','Cancelled'));

ALTER TABLE Equipment
DROP COLUMN category;

ALTER TABLE Review
RENAME TO EquipmentReview;
