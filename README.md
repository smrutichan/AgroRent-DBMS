# 🌾 AgroRent – Agricultural Equipment Rental System

A database-driven system designed to manage agricultural equipment rentals with efficient data organization, querying, and transaction handling.

---

## 📌 Problem
Farmers often face challenges in accessing agricultural equipment on demand. Existing solutions lack structured tracking of equipment availability, rental history, and transactions.

---

## 🎯 Objective
To design and implement a normalized relational database system that efficiently manages equipment rentals, users, and transactions.

---

## 🧠 System Overview

The system models real-world rental interactions between farmers and equipment providers, ensuring:
- Efficient data storage  
- Consistent transaction handling  
- Easy retrieval of rental and availability information  

---

## 🗂️ Database Design

### Key Entities
- **Users** – Farmers / Equipment owners  
- **Equipment** – Tools available for rent  
- **Rentals** – Records of equipment usage  
- **Transactions** – Payment and rental details

<img width="940" height="627" alt="image" src="https://github.com/user-attachments/assets/3027e32e-f0bd-4b62-b9a5-4a1f220fc65a" />


---

### 🔗 Relationships
- A user can rent multiple equipment items  
- Equipment can have multiple rental records  
- Each rental is associated with a transaction  

---

## ⚙️ Implementation

- Created relational schema using SQL  
- Defined primary and foreign key constraints  
- Implemented queries for:
  - Equipment availability  
  - Rental tracking  
  - Transaction handling  

---

## 🚀 Future Improvements

- Integrate with a full-stack application  
- Add indexing for faster query performance  
- Implement role-based access control  
- Enable real-time availability tracking  
