# 🧮 SQL Lab: DDL, DML, Constraints & Transaction Processing

This project demonstrates how to build and manipulate a relational database schema using Oracle SQL. It includes sequence creation, table definitions with constraints, data manipulation using DML, and understanding the behavior of transactions in a database system.

All SQL code was executed in [Oracle LiveSQL](https://livesql.oracle.com).

---

## 📘 Objectives

- Create database schema with normalized table structure
- Apply PRIMARY, FOREIGN, CHECK, and UNIQUE constraints
- Use sequences to auto-generate primary keys
- Perform DML operations: INSERT, UPDATE, DELETE
- Simulate transaction logic and understand FK constraint behavior
- Learn from failed operations due to constraint violations

---

## 🧪 Task Overview

### Task 1: Sequence Creation
Create `my_seq` starting at 1, increment by 1 to generate unique primary keys.

### Task 2: Table Design
Create 6 normalized tables:
- `CUSTOMER`, `CUST_ORDER`, `CART`, `PRODUCT`, `PROD_GROUP`, `PROD_PICT`
With full constraint naming and integrity enforcement.

### Task 3–6: Data Insertion
- Add rows to `CUSTOMER`, `PROD_GROUP`, `PRODUCT`
- Insert order to `CUST_ORDER` using sequence
- Add items to `CART` referencing the generated `ord_id`

### Task 7–9: Data Modification
- Increase all product prices by 12%
- Update optional phone number field
- Attempt deletion from `CUST_ORDER` and analyze constraint violation

---

## 🧱 Constraint Naming Convention

| Type         | Format Example              |
|--------------|-----------------------------|
| Primary Key  | `table_column_pk`           |
| Foreign Key  | `table_column_fk`           |
| Check        | `table_column_ck`           |
| Unique       | `table_column_uq`           |

---

## 🗂️ Files Included

| File | Description |
|------|-------------|
| `LAB 1.sql` | Full SQL source code |
| `Lab 1.docx` | Detailed task descriptions |
| `Lab 1 - Group 3.docx` | Group report with results |
| `Lab_1.pdf` | Assignment PDF (optional) |
| `README.md` | This file |
| `LICENSE` | MIT License (optional) |

---

## 🛠️ Tools Used

- SQL (Oracle)
- Oracle LiveSQL
- Microsoft Word / PDF

---

## ✍️ Author

**Kushmi Anuththara Chandrasena**  
MSc Data Science – Dalarna University  
📍 Stockholm, Sweden  
🔗 [LinkedIn](https://www.linkedin.com/in/kushmianuththarachandrasena/)

---

## 📄 License

MIT License – feel free to reuse and adapt the code.

---

## 🧠 What You Learn

- Schema design from scratch  
- Constraint enforcement and naming best practices  
- Transaction impact in real-world systems  
- FK violations and rollback strategy  
