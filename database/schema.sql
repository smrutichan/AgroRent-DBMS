CREATE DATABASE AgroRent;
USE AgroRent;

CREATE TABLE Users (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    phone VARCHAR(15) UNIQUE,
    role VARCHAR(20) NOT NULL CHECK (role IN ('Farmer','EquipmentOwner','Administrator')),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Farmer (
    farmer_id INT PRIMARY KEY,
    address VARCHAR(200),
    FOREIGN KEY (farmer_id) REFERENCES Users(user_id)
);

CREATE TABLE EquipmentOwner (
    owner_id INT PRIMARY KEY,
    business_name VARCHAR(100) NOT NULL,
    FOREIGN KEY (owner_id) REFERENCES Users(user_id)
);
CREATE TABLE Administrator (
    admin_id INT PRIMARY KEY,
    admin_level INT DEFAULT 1 CHECK (admin_level >= 1),
    FOREIGN KEY (admin_id) REFERENCES Users(user_id)
);

CREATE TABLE Equipment (
    equipment_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    description TEXT,
    price_per_day DECIMAL(10,2) NOT NULL CHECK (price_per_day > 0),
    availability_status VARCHAR(20) DEFAULT 'Available',
    owner_id INT NOT NULL,
    FOREIGN KEY (owner_id) REFERENCES EquipmentOwner(owner_id)
);

CREATE TABLE Booking (
    booking_id INT PRIMARY KEY AUTO_INCREMENT,
    booking_date DATE NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL CHECK (end_date >= start_date),
    status VARCHAR(20) DEFAULT 'Pending',
    farmer_id INT NOT NULL,
    equipment_id INT NOT NULL,
    FOREIGN KEY (farmer_id) REFERENCES Farmer(farmer_id),
    FOREIGN KEY (equipment_id) REFERENCES Equipment(equipment_id)
);


CREATE TABLE Payment (
    payment_id INT PRIMARY KEY AUTO_INCREMENT,
    amount DECIMAL(10,2) NOT NULL CHECK (amount > 0),
    payment_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    payment_method VARCHAR(30) NOT NULL,
    payment_status VARCHAR(20) DEFAULT 'Completed',
    booking_id INT UNIQUE NOT NULL,
    FOREIGN KEY (booking_id) REFERENCES Booking(booking_id)
);

CREATE TABLE Review (
    review_id INT PRIMARY KEY AUTO_INCREMENT,
    rating INT NOT NULL CHECK (rating BETWEEN 1 AND 5),
    comment TEXT,
    review_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    farmer_id INT NOT NULL,
    equipment_id INT NOT NULL,
    FOREIGN KEY (farmer_id) REFERENCES Farmer(farmer_id),
    FOREIGN KEY (equipment_id) REFERENCES Equipment(equipment_id)
);
