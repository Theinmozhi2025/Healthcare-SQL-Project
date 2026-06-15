-- ============================================================
--  HEALTHCARE DB — 55 QUERIES (BEGINNER TO INTERMEDIATE)
--  Topics: SELECT, WHERE, ORDER BY, LIMIT, LIKE, BETWEEN,
--          IN, DISTINCT, GROUP BY, HAVING, JOINs, Subqueries
-- ============================================================

USE HealthcareDB;

-- ============================================================
--  BEGINNER LEVEL (Q1 - Q20)
-- ============================================================

-- Q1. Show all patients
SELECT * FROM Patients;

-- Q2. Show all doctors
SELECT * FROM Doctors;

-- Q3. Show all department names and locations
SELECT dept_name, location FROM Departments;

-- Q4. Show patient first name, last name and phone number
SELECT first_name, last_name, phone FROM Patients;

-- Q5. Show all medicines and their prices
SELECT medicine_name, unit_price FROM Medicines;

-- Q6. Show all female patients
SELECT first_name, last_name, gender
FROM Patients
WHERE gender = 'Female';

-- Q7. Show all male patients
SELECT first_name, last_name, gender
FROM Patients
WHERE gender = 'Male';

-- Q8. Show all completed appointments
SELECT appointment_id, patient_id, doctor_id, appointment_date, reason
FROM Appointments
WHERE status = 'Completed';

-- Q9. Show all available rooms
SELECT room_number, room_type, charges_per_day
FROM Rooms
WHERE status = 'Available';

-- Q10. Show all patients with blood group O+
SELECT first_name, last_name, blood_group
FROM Patients
WHERE blood_group = 'O+';

-- Q11. Show all doctors with salary greater than 110000
SELECT first_name, last_name, specialization, salary
FROM Doctors
WHERE salary > 110000;

-- Q12. Show all pending bills
SELECT bill_id, patient_id, total_amount, payment_status
FROM Bills
WHERE payment_status = 'Pending';

-- Q13. Show all active insurance policies
SELECT patient_id, provider_name, policy_number, coverage_amount
FROM Insurance
WHERE status = 'Active';

-- Q14. Show all doctors sorted by salary highest to lowest
SELECT first_name, last_name, specialization, salary
FROM Doctors
ORDER BY salary DESC;

-- Q15. Show all patients sorted by registration date newest first
SELECT first_name, last_name, registered_date
FROM Patients
ORDER BY registered_date DESC;

-- Q16. Show top 5 most expensive rooms
SELECT room_number, room_type, charges_per_day
FROM Rooms
ORDER BY charges_per_day DESC
LIMIT 5;

-- Q17. Show the 3 highest paid doctors
SELECT first_name, last_name, salary
FROM Doctors
ORDER BY salary DESC
LIMIT 3;

-- Q18. Show all patients whose first name starts with 'A'
SELECT first_name, last_name, phone
FROM Patients
WHERE first_name LIKE 'A%';

-- Q19. Show all medicines whose name contains 'mg'
SELECT medicine_name, unit_price, stock_quantity
FROM Medicines
WHERE medicine_name LIKE '%mg%';

-- Q20. Show all doctors whose email ends with 'hospital.com'
SELECT first_name, last_name, email
FROM Doctors
WHERE email LIKE '%hospital.com';

-- Q21. Show doctors with salary between 100000 and 120000
SELECT first_name, last_name, specialization, salary
FROM Doctors
WHERE salary BETWEEN 100000 AND 120000;

-- Q22. Show appointments scheduled in January 2024
SELECT appointment_id, patient_id, appointment_date, status
FROM Appointments
WHERE appointment_date BETWEEN '2024-01-01' AND '2024-01-31';

-- Q23. Show medicines with price between 10 and 50
SELECT medicine_name, category, unit_price
FROM Medicines
WHERE unit_price BETWEEN 10 AND 50;

-- Q24. Show patients with blood group O+ or A+
SELECT first_name, last_name, blood_group
FROM Patients
WHERE blood_group IN ('O+', 'A+');

-- Q25. Show nurses working Morning or Night shift
SELECT first_name, last_name, shift
FROM Nurses
WHERE shift IN ('Morning', 'Night');

-- Q26. Show rooms of type ICU or Private
SELECT room_number, room_type, charges_per_day, status
FROM Rooms
WHERE room_type IN ('ICU', 'Private');

-- Q27. Show all unique blood groups in the patient table
SELECT DISTINCT blood_group FROM Patients;

-- Q28. Show all unique shifts used by nurses
SELECT DISTINCT shift FROM Nurses;

-- Q29. Show all unique room types
SELECT DISTINCT room_type FROM Rooms;

-- Q30. Show female patients with blood group A+
SELECT first_name, last_name, gender, blood_group
FROM Patients
WHERE gender = 'Female' AND blood_group = 'A+';

-- Q31. Show lab results that are Abnormal or Critical
SELECT result_id, patient_id, result_value, status, remarks
FROM LabResults
WHERE status IN ('Abnormal', 'Critical');

-- Q32. Show medicines with stock quantity less than 300
SELECT medicine_name, stock_quantity, reorder_level
FROM Medicines
WHERE stock_quantity < 300;

-- Q33. Show all admitted patients (not yet discharged)
SELECT admission_id, patient_id, admission_date, reason
FROM Admissions
WHERE status = 'Admitted';

-- Q34. Show all nurses in department 1
SELECT first_name, last_name, shift
FROM Nurses
WHERE department_id = 1;

-- Q35. Show all staff with salary above 30000
SELECT first_name, last_name, role, salary
FROM Staff
WHERE salary > 30000
ORDER BY salary DESC;

-- ============================================================
--  INTERMEDIATE LEVEL (Q36 - Q55)
-- ============================================================

-- Q36. COUNT - Total number of patients registered
SELECT COUNT(*) AS total_patients FROM Patients;

-- Q37. COUNT - Total number of doctors per department
SELECT department_id, COUNT(*) AS total_doctors
FROM Doctors
GROUP BY department_id;

-- Q38. SUM - Total revenue from all bills
SELECT SUM(total_amount) AS total_revenue FROM Bills;

-- Q39. AVG - Average doctor salary
SELECT ROUND(AVG(salary), 2) AS avg_doctor_salary FROM Doctors;

-- Q40. MAX and MIN - Highest and lowest room charges
SELECT MAX(charges_per_day) AS highest_charge,
       MIN(charges_per_day) AS lowest_charge
FROM Rooms;

-- Q41. GROUP BY - Count appointments by status
SELECT status, COUNT(*) AS total
FROM Appointments
GROUP BY status;

-- Q42. GROUP BY - Total bill amount per patient
SELECT patient_id, SUM(total_amount) AS total_billed
FROM Bills
GROUP BY patient_id
ORDER BY total_billed DESC;

-- Q43. HAVING - Departments with more than 1 doctor
SELECT department_id, COUNT(*) AS total_doctors
FROM Doctors
GROUP BY department_id
HAVING total_doctors > 1;

-- Q44. HAVING - Patients with total bill above 10000
SELECT patient_id, SUM(total_amount) AS total_billed
FROM Bills
GROUP BY patient_id
HAVING total_billed > 10000;

-- Q45. INNER JOIN - Patient name with their appointment details
SELECT
    CONCAT(p.first_name,' ',p.last_name) AS patient_name,
    a.appointment_date,
    a.status,
    a.reason
FROM Appointments a
INNER JOIN Patients p ON a.patient_id = p.patient_id;

-- Q46. INNER JOIN - Doctor name with their department
SELECT
    CONCAT(d.first_name,' ',d.last_name) AS doctor_name,
    d.specialization,
    dept.dept_name,
    dept.location
FROM Doctors d
INNER JOIN Departments dept ON d.department_id = dept.department_id;

-- Q47. INNER JOIN - Patient name with their bill total
SELECT
    CONCAT(p.first_name,' ',p.last_name) AS patient_name,
    b.bill_date,
    b.total_amount,
    b.payment_status
FROM Bills b
INNER JOIN Patients p ON b.patient_id = p.patient_id
ORDER BY b.total_amount DESC;

-- Q48. LEFT JOIN - All patients with their insurance (show even if no insurance)
SELECT
    CONCAT(p.first_name,' ',p.last_name) AS patient_name,
    IFNULL(i.provider_name, 'No Insurance')  AS insurance_provider,
    IFNULL(i.status, 'N/A')                  AS insurance_status
FROM Patients p
LEFT JOIN Insurance i ON p.patient_id = i.patient_id;

-- Q49. INNER JOIN - Lab results with patient and test name
SELECT
    CONCAT(p.first_name,' ',p.last_name) AS patient_name,
    lt.test_name,
    lr.result_value,
    lr.status AS result_status,
    lr.test_date
FROM LabResults lr
INNER JOIN Patients p  ON lr.patient_id = p.patient_id
INNER JOIN LabTests lt ON lr.test_id    = lt.test_id;

-- Q50. INNER JOIN - Prescriptions with patient and doctor name
SELECT
    CONCAT(p.first_name,' ',p.last_name) AS patient_name,
    CONCAT(d.first_name,' ',d.last_name) AS doctor_name,
    pr.medication_name,
    pr.dosage,
    pr.frequency,
    pr.duration_days
FROM Prescriptions pr
INNER JOIN Patients p ON pr.patient_id = p.patient_id
INNER JOIN Doctors  d ON pr.doctor_id  = d.doctor_id;

-- Q51. MULTI JOIN - Admission with patient, doctor and room details
SELECT
    CONCAT(p.first_name,' ',p.last_name) AS patient_name,
    CONCAT(d.first_name,' ',d.last_name) AS doctor_name,
    r.room_number,
    r.room_type,
    a.admission_date,
    a.discharge_date,
    a.status
FROM Admissions a
INNER JOIN Patients p ON a.patient_id = p.patient_id
INNER JOIN Doctors  d ON a.doctor_id  = d.doctor_id
INNER JOIN Rooms    r ON a.room_id    = r.room_id;

-- Q52. GROUP BY with JOIN - Count patients per doctor
SELECT
    CONCAT(d.first_name,' ',d.last_name) AS doctor_name,
    COUNT(a.patient_id) AS total_patients_seen
FROM Appointments a
INNER JOIN Doctors d ON a.doctor_id = d.doctor_id
GROUP BY d.doctor_id, d.first_name, d.last_name
ORDER BY total_patients_seen DESC;

-- Q53. SUBQUERY - Patients who have a bill above average bill amount
SELECT first_name, last_name
FROM Patients
WHERE patient_id IN (
    SELECT patient_id FROM Bills
    WHERE total_amount > (SELECT AVG(total_amount) FROM Bills)
);

-- Q54. SUBQUERY - Doctors who earn more than the average doctor salary
SELECT first_name, last_name, specialization, salary
FROM Doctors
WHERE salary > (SELECT AVG(salary) FROM Doctors)
ORDER BY salary DESC;

-- Q55. MULTI JOIN with GROUP BY - Department wise total revenue
SELECT
    dept.dept_name,
    COUNT(b.bill_id)        AS total_bills,
    SUM(b.total_amount)     AS total_revenue,
    ROUND(AVG(b.total_amount),2) AS avg_bill_amount
FROM Bills b
INNER JOIN Admissions  a    ON b.admission_id  = a.admission_id
INNER JOIN Doctors     d    ON a.doctor_id     = d.doctor_id
INNER JOIN Departments dept ON d.department_id = dept.department_id
GROUP BY dept.dept_name
ORDER BY total_revenue DESC;

-- ============================================================
--  END OF 55 QUERIES
-- ============================================================
