# 🏥 Healthcare Management System — MySQL Project

![MySQL](https://img.shields.io/badge/Database-MySQL-blue?style=for-the-badge&logo=mysql)
![SQL](https://img.shields.io/badge/Language-SQL-orange?style=for-the-badge)
![Status](https://img.shields.io/badge/Status-Complete-brightgreen?style=for-the-badge)

A complete **Healthcare Management System** built using MySQL. This project covers real-world hospital operations including patient management, doctor appointments, billing, lab results, pharmacy inventory, and more.

---

## 📁 Project Structure

```
Healthcare-SQL-Project/
│
├── healthcare_MASTER.sql       # All 15 tables + data + triggers + stored procedures + window functions
├── healthcare_55_queries.sql   # 55 SQL queries from beginner to intermediate
└── README.md                   # Project documentation
```

---

## 🗄️ Database Schema — 15 Tables

| # | Table | Description |
|---|-------|-------------|
| 1 | `Departments` | Hospital departments like Cardiology, Neurology etc. |
| 2 | `Doctors` | Doctor profiles with specialization and salary |
| 3 | `Patients` | Patient demographics, blood group and contact info |
| 4 | `Appointments` | Doctor-patient appointment scheduling |
| 5 | `MedicalRecords` | Diagnosis, treatment and follow-up records |
| 6 | `Prescriptions` | Medicines prescribed per medical record |
| 7 | `Nurses` | Nursing staff with shift assignments |
| 8 | `Rooms` | Room types (ICU, Private, General) with charges |
| 9 | `Admissions` | Patient admission and discharge tracking |
| 10 | `Bills` | Auto-calculated invoices per admission |
| 11 | `LabTests` | Lab test catalog with normal ranges and costs |
| 12 | `LabResults` | Patient test results (Normal / Abnormal / Critical) |
| 13 | `Medicines` | Drug inventory with stock and expiry tracking |
| 14 | `Staff` | Non-medical staff (receptionists, pharmacists etc.) |
| 15 | `Insurance` | Patient insurance policies and claim status |

---

## ⚙️ Features Implemented

### 🔒 Constraints
- `PRIMARY KEY` on all tables
- `FOREIGN KEY` relationships across all related tables
- `CHECK` constraints on gender, blood group, salary, stock, price, dates
- `UNIQUE` constraints on email and phone
- `NOT NULL` and `DEFAULT` values on critical columns

### ⚡ Triggers (7 Triggers)
| Trigger | Event | Action |
|---------|-------|--------|
| `trg_after_appointment_insert` | After INSERT on Appointments | Logs new appointment in AuditLog |
| `trg_after_appointment_update` | After UPDATE on Appointments | Logs status change in AuditLog |
| `trg_after_admission_insert` | After INSERT on Admissions | Sets room status to Occupied |
| `trg_after_admission_discharge` | After UPDATE on Admissions | Sets room to Available on discharge |
| `trg_before_patient_insert` | Before INSERT on Patients | Auto-uppercases blood group |
| `trg_after_bill_insert` | After INSERT on Bills | Logs bill creation in AuditLog |
| `trg_medicine_low_stock` | After UPDATE on Medicines | Alerts when stock falls below reorder level |

### 🗄️ Stored Procedures (7 Procedures)
| Procedure | Purpose |
|-----------|---------|
| `sp_GetPatientAppointments` | Get all appointments for a specific patient |
| `sp_GetPatientHistory` | Get full medical history of a patient |
| `sp_RegisterPatient` | Register a new patient with all details |
| `sp_DepartmentSummary` | Department-wise doctor count and salary stats |
| `sp_GetPatientBill` | Get complete bill details for a patient |
| `sp_BookAppointment` | Book appointment with conflict validation |
| `sp_GetCriticalLabResults` | Fetch all critical lab results |

### 📊 Window Functions
- `RANK()` — Rank doctors by salary within each department
- `DENSE_RANK()` — Rank patients by bill total amount
- `ROW_NUMBER()` — Row numbers for appointments per doctor
- `SUM() OVER` — Running total of bills per patient
- `AVG() OVER` — Compare each doctor's salary to department average
- `LAG()` — Days since last visit per patient
- `LEAD()` — Next appointment date per patient
- `NTILE()` — Divide doctors into salary tiers
- `FIRST_VALUE()` — Top earner in each department
- `COUNT() OVER` — Total appointments per doctor

### 🔗 JOINs Used
- `INNER JOIN` — Patients, Doctors, Departments, Bills, Lab Results
- `LEFT JOIN` — Patients without insurance, Doctors without appointments
- `RIGHT JOIN` — Rooms with and without admissions
- Multi-table JOINs with `GROUP BY` and `HAVING`

---

## 📝 Queries — 55 SQL Queries

| Level | Query Range | Topics |
|-------|-------------|--------|
| 🟢 Beginner | Q1 – Q35 | SELECT, WHERE, ORDER BY, LIMIT, LIKE, BETWEEN, IN, DISTINCT, AND/OR |
| 🟡 Intermediate | Q36 – Q55 | COUNT, SUM, AVG, MAX, MIN, GROUP BY, HAVING, JOINs, Subqueries |

---

## 🚀 How to Run This Project

### Prerequisites
- MySQL 8.0 or above
- MySQL Workbench (recommended)

### Steps

**1. Clone the repository**
```bash
git clone https://github.com/YourUsername/Healthcare-SQL-Project.git
```

**2. Open MySQL Workbench**

**3. Run the master file first**
- Open `healthcare_MASTER.sql`
- Press `Ctrl + A` to select all
- Press `Ctrl + Shift + Enter` to run

**4. Run the queries file**
- Open `healthcare_55_queries.sql`
- Click any query and press `Ctrl + Enter` to run individually

---

## 🧪 Sample Stored Procedure Calls

```sql
-- Get all appointments for patient ID 1
CALL sp_GetPatientAppointments(1);

-- Get full medical history for patient ID 2
CALL sp_GetPatientHistory(2);

-- Register a new patient
CALL sp_RegisterPatient('Arun','Balaji','1992-05-10','Male','B+','9888001234','arun.b@gmail.com','15 Nungambakkam, Chennai');

-- Get department summary
CALL sp_DepartmentSummary();

-- Book an appointment
CALL sp_BookAppointment(3, 2, '2024-03-01', '10:00:00', 'Routine checkup');

-- Get all critical lab results
CALL sp_GetCriticalLabResults();
```

---

## 🔗 Entity Relationship Overview

```
Departments ──< Doctors ──< Appointments >── Patients
                  │                              │
                  └──< MedicalRecords >──────────┘
                              │
                              └──< Prescriptions
                                       │
                                   Medicines

Patients ──< Admissions >── Rooms
    │              │
    └──< Bills     └── Nurses
    │
    └──< LabResults >── LabTests
    │
    └──< Insurance
```

---

## 👨‍💻 Author

Theinmozhi W
- GitHub:Theinmozhi2025/Healthcare-SQL-Project.git
- LinkedIn:www.linkedin.com/in/theinmozhi-w

---

## 📄 License

This project is open source and available under the [MIT License](LICENSE).
