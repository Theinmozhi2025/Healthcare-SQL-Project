-- ============================================================
--  HEALTHCARE MANAGEMENT SYSTEM - MySQL Database
--  15 Tables with CREATE + INSERT Sample Data
-- ============================================================

CREATE DATABASE IF NOT EXISTS HealthcareDB;
USE HealthcareDB;

-- ============================================================
-- TABLE 1: DEPARTMENTS
-- ============================================================
CREATE TABLE Departments (
    department_id   INT AUTO_INCREMENT PRIMARY KEY,
    dept_name       VARCHAR(100) NOT NULL,
    location        VARCHAR(100),
    phone           VARCHAR(15),
    head_doctor_id  INT
);

INSERT INTO Departments (dept_name, location, phone) VALUES
('Cardiology',       'Block A, Floor 2', '044-1001'),
('Neurology',        'Block B, Floor 3', '044-1002'),
('Orthopedics',      'Block C, Floor 1', '044-1003'),
('Pediatrics',       'Block D, Floor 2', '044-1004'),
('Oncology',         'Block E, Floor 4', '044-1005'),
('Emergency',        'Block A, Floor 1', '044-1006'),
('Radiology',        'Block F, Floor 1', '044-1007'),
('General Surgery',  'Block G, Floor 3', '044-1008'),
('Dermatology',      'Block H, Floor 2', '044-1009'),
('Gynecology',       'Block I, Floor 3', '044-1010');


-- ============================================================
-- TABLE 2: DOCTORS
-- ============================================================
CREATE TABLE Doctors (
    doctor_id       INT AUTO_INCREMENT PRIMARY KEY,
    first_name      VARCHAR(50) NOT NULL,
    last_name       VARCHAR(50) NOT NULL,
    specialization  VARCHAR(100),
    department_id   INT,
    email           VARCHAR(100) UNIQUE,
    phone           VARCHAR(15),
    hire_date       DATE,
    salary          DECIMAL(10,2),
    FOREIGN KEY (department_id) REFERENCES Departments(department_id)
);

INSERT INTO Doctors (first_name, last_name, specialization, department_id, email, phone, hire_date, salary) VALUES
('Arjun',    'Sharma',     'Cardiologist',       1, 'arjun.sharma@hospital.com',    '9876501001', '2015-06-01', 120000.00),
('Priya',    'Nair',       'Neurologist',        2, 'priya.nair@hospital.com',      '9876501002', '2017-03-15', 115000.00),
('Ravi',     'Kumar',      'Orthopedic Surgeon', 3, 'ravi.kumar@hospital.com',      '9876501003', '2016-09-20', 110000.00),
('Sneha',    'Pillai',     'Pediatrician',       4, 'sneha.pillai@hospital.com',    '9876501004', '2018-01-10', 105000.00),
('Vikram',   'Menon',      'Oncologist',         5, 'vikram.menon@hospital.com',    '9876501005', '2014-11-05', 130000.00),
('Deepa',    'Raj',        'Emergency Physician',6, 'deepa.raj@hospital.com',       '9876501006', '2019-07-22', 100000.00),
('Karthik',  'Sundaram',   'Radiologist',        7, 'karthik.s@hospital.com',       '9876501007', '2020-02-18', 98000.00),
('Ananya',   'Krishnan',   'General Surgeon',    8, 'ananya.k@hospital.com',        '9876501008', '2013-05-30', 125000.00),
('Suresh',   'Babu',       'Dermatologist',      9, 'suresh.babu@hospital.com',     '9876501009', '2021-08-12', 92000.00),
('Lakshmi',  'Iyer',       'Gynecologist',      10, 'lakshmi.iyer@hospital.com',    '9876501010', '2016-04-25', 108000.00);


-- ============================================================
-- TABLE 3: PATIENTS
-- ============================================================
CREATE TABLE Patients (
    patient_id      INT AUTO_INCREMENT PRIMARY KEY,
    first_name      VARCHAR(50) NOT NULL,
    last_name       VARCHAR(50) NOT NULL,
    date_of_birth   DATE,
    gender          ENUM('Male','Female','Other'),
    blood_group     VARCHAR(5),
    phone           VARCHAR(15),
    email           VARCHAR(100),
    address         TEXT,
    registered_date DATE DEFAULT (CURRENT_DATE)
);

INSERT INTO Patients (first_name, last_name, date_of_birth, gender, blood_group, phone, email, address, registered_date) VALUES
('Ramesh',   'Venkat',    '1985-04-12', 'Male',   'O+',  '9500001001', 'ramesh.v@gmail.com',   '12 Anna Nagar, Chennai',    '2023-01-05'),
('Meena',    'Subramani', '1990-07-23', 'Female', 'A+',  '9500001002', 'meena.s@gmail.com',    '45 T Nagar, Chennai',       '2023-02-10'),
('Gopal',    'Rajan',     '1978-11-30', 'Male',   'B+',  '9500001003', 'gopal.r@gmail.com',    '78 Adyar, Chennai',         '2023-03-15'),
('Kavya',    'Murthy',    '2000-01-15', 'Female', 'AB-', '9500001004', 'kavya.m@gmail.com',    '23 Velachery, Chennai',     '2023-04-20'),
('Sanjay',   'Patel',     '1965-09-08', 'Male',   'O-',  '9500001005', 'sanjay.p@gmail.com',   '56 Porur, Chennai',         '2023-05-01'),
('Divya',    'Anand',     '1995-03-27', 'Female', 'A-',  '9500001006', 'divya.a@gmail.com',    '90 Tambaram, Chennai',      '2023-06-14'),
('Harish',   'Reddy',     '1970-12-05', 'Male',   'B-',  '9500001007', 'harish.r@gmail.com',   '34 Guindy, Chennai',        '2023-07-22'),
('Nithya',   'Selvam',    '1988-06-18', 'Female', 'O+',  '9500001008', 'nithya.s@gmail.com',   '67 Chromepet, Chennai',     '2023-08-09'),
('Ajay',     'Mishra',    '2010-02-20', 'Male',   'A+',  '9500001009', 'ajay.m@gmail.com',     '11 Avadi, Chennai',         '2023-09-03'),
('Pooja',    'Singh',     '1982-08-14', 'Female', 'AB+', '9500001010', 'pooja.s@gmail.com',    '88 Perambur, Chennai',      '2023-10-17');


-- ============================================================
-- TABLE 4: APPOINTMENTS
-- ============================================================
CREATE TABLE Appointments (
    appointment_id  INT AUTO_INCREMENT PRIMARY KEY,
    patient_id      INT NOT NULL,
    doctor_id       INT NOT NULL,
    appointment_date DATE NOT NULL,
    appointment_time TIME NOT NULL,
    status          ENUM('Scheduled','Completed','Cancelled','No-Show') DEFAULT 'Scheduled',
    reason          VARCHAR(255),
    notes           TEXT,
    FOREIGN KEY (patient_id) REFERENCES Patients(patient_id),
    FOREIGN KEY (doctor_id)  REFERENCES Doctors(doctor_id)
);

INSERT INTO Appointments (patient_id, doctor_id, appointment_date, appointment_time, status, reason) VALUES
(1,  1, '2024-01-10', '09:00:00', 'Completed',  'Chest pain checkup'),
(2,  2, '2024-01-12', '10:30:00', 'Completed',  'Headache and dizziness'),
(3,  3, '2024-01-15', '11:00:00', 'Completed',  'Knee pain evaluation'),
(4,  4, '2024-01-18', '09:30:00', 'Completed',  'Child fever and cough'),
(5,  5, '2024-01-20', '14:00:00', 'Scheduled',  'Cancer follow-up'),
(6,  6, '2024-01-22', '08:00:00', 'Completed',  'Accident injury'),
(7,  7, '2024-01-25', '13:00:00', 'Cancelled',  'X-ray for chest'),
(8,  8, '2024-01-28', '15:30:00', 'Completed',  'Appendix pain'),
(9,  9, '2024-02-01', '10:00:00', 'Scheduled',  'Skin rash treatment'),
(10, 10,'2024-02-05', '11:30:00', 'Completed',  'Pregnancy checkup');


-- ============================================================
-- TABLE 5: MEDICAL RECORDS
-- ============================================================
CREATE TABLE MedicalRecords (
    record_id       INT AUTO_INCREMENT PRIMARY KEY,
    patient_id      INT NOT NULL,
    doctor_id       INT NOT NULL,
    visit_date      DATE NOT NULL,
    diagnosis       TEXT,
    treatment       TEXT,
    notes           TEXT,
    follow_up_date  DATE,
    FOREIGN KEY (patient_id) REFERENCES Patients(patient_id),
    FOREIGN KEY (doctor_id)  REFERENCES Doctors(doctor_id)
);

INSERT INTO MedicalRecords (patient_id, doctor_id, visit_date, diagnosis, treatment, notes, follow_up_date) VALUES
(1,  1, '2024-01-10', 'Hypertension Stage 1',     'Prescribed Amlodipine 5mg',         'BP: 150/95. Monitor weekly.',        '2024-02-10'),
(2,  2, '2024-01-12', 'Migraine',                  'Prescribed Sumatriptan',            'Recurrent since 3 months.',          '2024-02-12'),
(3,  3, '2024-01-15', 'Osteoarthritis - Right Knee','Physiotherapy + Naproxen 500mg',   'X-ray confirms grade 2 OA.',         '2024-02-15'),
(4,  4, '2024-01-18', 'Viral Upper Respiratory Infection','Rest + Paracetamol syrup',  'Temp: 101F. No antibiotics needed.', '2024-01-25'),
(5,  5, '2024-01-20', 'Breast Cancer Stage II',    'Chemotherapy cycle 3',              'Tolerating treatment well.',         '2024-02-20'),
(6,  6, '2024-01-22', 'Fractured Ulna (Left)',     'Casting + Pain management',         'X-ray confirmed fracture.',          '2024-02-22'),
(8,  8, '2024-01-28', 'Acute Appendicitis',        'Emergency appendectomy performed',  'Surgery successful, recovering.',    '2024-02-14'),
(9,  9, '2024-02-01', 'Eczema',                    'Hydrocortisone cream + Cetirizine', 'Avoid soap irritants.',              '2024-03-01'),
(10,10, '2024-02-05', '28 weeks pregnancy - normal','Iron & Folic acid supplements',    'All vitals normal. Ultrasound done.','2024-03-05'),
(7,  1, '2024-02-08', 'Atrial Fibrillation',       'Warfarin 5mg daily',                'Refer for ECG monitoring.',          '2024-03-08');


-- ============================================================
-- TABLE 6: PRESCRIPTIONS
-- ============================================================
CREATE TABLE Prescriptions (
    prescription_id INT AUTO_INCREMENT PRIMARY KEY,
    record_id       INT NOT NULL,
    patient_id      INT NOT NULL,
    doctor_id       INT NOT NULL,
    prescribed_date DATE NOT NULL,
    medication_name VARCHAR(100) NOT NULL,
    dosage          VARCHAR(50),
    frequency       VARCHAR(50),
    duration_days   INT,
    FOREIGN KEY (record_id)   REFERENCES MedicalRecords(record_id),
    FOREIGN KEY (patient_id)  REFERENCES Patients(patient_id),
    FOREIGN KEY (doctor_id)   REFERENCES Doctors(doctor_id)
);

INSERT INTO Prescriptions (record_id, patient_id, doctor_id, prescribed_date, medication_name, dosage, frequency, duration_days) VALUES
(1,  1,  1, '2024-01-10', 'Amlodipine',      '5mg',    'Once daily',          30),
(1,  1,  1, '2024-01-10', 'Aspirin',         '75mg',   'Once daily after food',30),
(2,  2,  2, '2024-01-12', 'Sumatriptan',     '50mg',   'As needed',           15),
(3,  3,  3, '2024-01-15', 'Naproxen',        '500mg',  'Twice daily',         14),
(4,  4,  4, '2024-01-18', 'Paracetamol',     '250mg',  'Three times daily',    5),
(5,  5,  5, '2024-01-20', 'Ondansetron',     '4mg',    'Twice daily',         21),
(8,  8,  8, '2024-01-28', 'Amoxicillin',     '500mg',  'Three times daily',    7),
(9,  9,  9, '2024-02-01', 'Hydrocortisone',  '1% cream','Twice daily topical', 14),
(9,  9,  9, '2024-02-01', 'Cetirizine',      '10mg',   'Once at night',       10),
(10,10, 10, '2024-02-05', 'Ferrous Sulfate',  '200mg',  'Once daily',          60);


-- ============================================================
-- TABLE 7: NURSES
-- ============================================================
CREATE TABLE Nurses (
    nurse_id        INT AUTO_INCREMENT PRIMARY KEY,
    first_name      VARCHAR(50) NOT NULL,
    last_name       VARCHAR(50) NOT NULL,
    department_id   INT,
    shift           ENUM('Morning','Afternoon','Night'),
    phone           VARCHAR(15),
    email           VARCHAR(100),
    hire_date       DATE,
    salary          DECIMAL(10,2),
    FOREIGN KEY (department_id) REFERENCES Departments(department_id)
);

INSERT INTO Nurses (first_name, last_name, department_id, shift, phone, email, hire_date, salary) VALUES
('Rani',     'Devi',      1, 'Morning',   '9600001001', 'rani.d@hospital.com',   '2018-03-01', 45000.00),
('Geetha',   'Kumari',    2, 'Afternoon', '9600001002', 'geetha.k@hospital.com', '2019-06-15', 43000.00),
('Saranya',  'Mani',      3, 'Night',     '9600001003', 'saranya.m@hospital.com','2020-01-20', 42000.00),
('Preethi',  'Das',       4, 'Morning',   '9600001004', 'preethi.d@hospital.com','2017-09-10', 46000.00),
('Kalpana',  'Raj',       5, 'Afternoon', '9600001005', 'kalpana.r@hospital.com','2016-11-25', 47000.00),
('Malathi',  'Suresh',    6, 'Night',     '9600001006', 'malathi.s@hospital.com','2021-04-05', 44000.00),
('Vasantha', 'Ravi',      7, 'Morning',   '9600001007', 'vasantha.r@hospital.com','2022-07-18',41000.00),
('Indhu',    'Mohan',     8, 'Afternoon', '9600001008', 'indhu.m@hospital.com',  '2015-12-30', 48000.00),
('Suganya',  'Vel',       9, 'Night',     '9600001009', 'suganya.v@hospital.com','2023-02-14', 40000.00),
('Rohini',   'Arumugam', 10, 'Morning',   '9600001010', 'rohini.a@hospital.com', '2019-08-22', 45500.00);


-- ============================================================
-- TABLE 8: ROOMS
-- ============================================================
CREATE TABLE Rooms (
    room_id         INT AUTO_INCREMENT PRIMARY KEY,
    room_number     VARCHAR(10) NOT NULL UNIQUE,
    room_type       ENUM('General','Semi-Private','Private','ICU','Operation Theater') NOT NULL,
    department_id   INT,
    capacity        INT DEFAULT 1,
    status          ENUM('Available','Occupied','Under Maintenance') DEFAULT 'Available',
    charges_per_day DECIMAL(8,2),
    FOREIGN KEY (department_id) REFERENCES Departments(department_id)
);

INSERT INTO Rooms (room_number, room_type, department_id, capacity, status, charges_per_day) VALUES
('A101', 'General',           1, 4, 'Occupied',   1500.00),
('A102', 'Semi-Private',      1, 2, 'Available',  2500.00),
('B201', 'Private',           2, 1, 'Occupied',   4000.00),
('B202', 'ICU',               2, 1, 'Occupied',   8000.00),
('C301', 'General',           3, 4, 'Available',  1500.00),
('C302', 'Semi-Private',      3, 2, 'Available',  2500.00),
('D401', 'Private',           4, 1, 'Occupied',   4000.00),
('E501', 'ICU',               5, 1, 'Occupied',   8000.00),
('G701', 'Operation Theater', 8, 2, 'Available', 15000.00),
('F601', 'General',           6, 6, 'Occupied',   1000.00);


-- ============================================================
-- TABLE 9: ADMISSIONS
-- ============================================================
CREATE TABLE Admissions (
    admission_id    INT AUTO_INCREMENT PRIMARY KEY,
    patient_id      INT NOT NULL,
    doctor_id       INT NOT NULL,
    room_id         INT NOT NULL,
    admission_date  DATE NOT NULL,
    discharge_date  DATE,
    reason          TEXT,
    status          ENUM('Admitted','Discharged','Transferred') DEFAULT 'Admitted',
    FOREIGN KEY (patient_id) REFERENCES Patients(patient_id),
    FOREIGN KEY (doctor_id)  REFERENCES Doctors(doctor_id),
    FOREIGN KEY (room_id)    REFERENCES Rooms(room_id)
);

INSERT INTO Admissions (patient_id, doctor_id, room_id, admission_date, discharge_date, reason, status) VALUES
(1,  1,  1, '2024-01-10', '2024-01-15', 'Hypertension management',       'Discharged'),
(2,  2,  3, '2024-01-12', '2024-01-18', 'Severe migraine episode',       'Discharged'),
(5,  5,  8, '2024-01-20', NULL,         'Chemotherapy admission',         'Admitted'),
(6,  6, 10, '2024-01-22', '2024-01-24', 'Emergency fracture treatment',  'Discharged'),
(8,  8,  9, '2024-01-28', '2024-02-03', 'Post-appendectomy recovery',    'Discharged'),
(7,  1,  4, '2024-02-08', NULL,         'Atrial fibrillation monitoring','Admitted'),
(3,  3,  5, '2024-02-10', '2024-02-17', 'Knee surgery recovery',         'Discharged'),
(10,10,  7, '2024-02-05', NULL,         'High-risk pregnancy monitoring','Admitted'),
(4,  4,  6, '2024-01-18', '2024-01-20', 'Pediatric fever observation',   'Discharged'),
(9,  9,  2, '2024-02-01', '2024-02-04', 'Severe eczema treatment',       'Discharged');


-- ============================================================
-- TABLE 10: BILLS / INVOICES
-- ============================================================
CREATE TABLE Bills (
    bill_id         INT AUTO_INCREMENT PRIMARY KEY,
    patient_id      INT NOT NULL,
    admission_id    INT,
    bill_date       DATE NOT NULL,
    room_charges    DECIMAL(10,2) DEFAULT 0.00,
    doctor_charges  DECIMAL(10,2) DEFAULT 0.00,
    medicine_charges DECIMAL(10,2) DEFAULT 0.00,
    lab_charges     DECIMAL(10,2) DEFAULT 0.00,
    other_charges   DECIMAL(10,2) DEFAULT 0.00,
    total_amount    DECIMAL(10,2) GENERATED ALWAYS AS 
                    (room_charges + doctor_charges + medicine_charges + lab_charges + other_charges) STORED,
    payment_status  ENUM('Pending','Paid','Partially Paid','Insurance Claimed') DEFAULT 'Pending',
    FOREIGN KEY (patient_id)   REFERENCES Patients(patient_id),
    FOREIGN KEY (admission_id) REFERENCES Admissions(admission_id)
);

INSERT INTO Bills (patient_id, admission_id, bill_date, room_charges, doctor_charges, medicine_charges, lab_charges, other_charges, payment_status) VALUES
(1,  1, '2024-01-15',  7500.00, 3000.00,  800.00, 1200.00,  500.00, 'Paid'),
(2,  2, '2024-01-18',  9000.00, 3500.00, 1200.00, 2000.00,  600.00, 'Paid'),
(5,  3, '2024-01-31', 56000.00,10000.00, 8500.00, 5000.00, 2000.00, 'Insurance Claimed'),
(6,  4, '2024-01-24',  2000.00, 2000.00,  600.00, 3000.00,  400.00, 'Paid'),
(8,  5, '2024-02-03', 10500.00, 8000.00, 1500.00, 2500.00, 1000.00, 'Paid'),
(3,  7, '2024-02-17', 10500.00, 7000.00, 2000.00, 3000.00,  500.00, 'Partially Paid'),
(4,  9, '2024-01-20',  3000.00, 1500.00,  300.00,  500.00,  200.00, 'Paid'),
(9, 10, '2024-02-04',  4500.00, 2000.00,  700.00,  800.00,  300.00, 'Paid'),
(7,  6, '2024-02-29', 16000.00, 5000.00, 3000.00, 2000.00,  800.00, 'Pending'),
(10, 8, '2024-02-29', 20000.00, 4000.00, 2500.00, 1500.00,  700.00, 'Insurance Claimed');


-- ============================================================
-- TABLE 11: LAB TESTS
-- ============================================================
CREATE TABLE LabTests (
    test_id         INT AUTO_INCREMENT PRIMARY KEY,
    test_name       VARCHAR(100) NOT NULL,
    description     VARCHAR(255),
    normal_range    VARCHAR(100),
    unit            VARCHAR(30),
    cost            DECIMAL(8,2)
);

INSERT INTO LabTests (test_name, description, normal_range, unit, cost) VALUES
('Complete Blood Count',     'Full blood panel',                     '4.5-11 x10^9/L', 'x10^9/L', 350.00),
('Blood Glucose Fasting',    'Fasting blood sugar test',             '70-100',         'mg/dL',    150.00),
('Lipid Profile',            'Cholesterol and triglycerides',        '<200',           'mg/dL',    500.00),
('Liver Function Test',      'ALT, AST, Bilirubin panel',           'ALT: 7-56 U/L',  'U/L',      600.00),
('Kidney Function Test',     'Creatinine, BUN, eGFR',               '0.6-1.2',        'mg/dL',    550.00),
('Thyroid Function Test',    'TSH, T3, T4',                         'TSH: 0.4-4.0',   'mIU/L',    700.00),
('Urine Routine',            'Physical, chemical, microscopic exam', 'pH: 4.5-8.0',    '',         100.00),
('ECG',                      'Electrocardiogram',                    'Normal sinus rhythm','',     200.00),
('X-Ray Chest',              'Chest X-ray PA view',                  'Clear lung fields','',       400.00),
('MRI Brain',                'Magnetic resonance imaging of brain',  'No abnormality', '',        3500.00);


-- ============================================================
-- TABLE 12: LAB RESULTS
-- ============================================================
CREATE TABLE LabResults (
    result_id       INT AUTO_INCREMENT PRIMARY KEY,
    patient_id      INT NOT NULL,
    test_id         INT NOT NULL,
    doctor_id       INT NOT NULL,
    test_date       DATE NOT NULL,
    result_value    VARCHAR(100),
    status          ENUM('Normal','Abnormal','Critical') DEFAULT 'Normal',
    remarks         TEXT,
    FOREIGN KEY (patient_id) REFERENCES Patients(patient_id),
    FOREIGN KEY (test_id)    REFERENCES LabTests(test_id),
    FOREIGN KEY (doctor_id)  REFERENCES Doctors(doctor_id)
);

INSERT INTO LabResults (patient_id, test_id, doctor_id, test_date, result_value, status, remarks) VALUES
(1,  1, 1, '2024-01-10', '9.8',          'Normal',   'WBC within range'),
(1,  3, 1, '2024-01-10', '210',          'Abnormal', 'Borderline high cholesterol'),
(2,  10,2, '2024-01-12', 'No abnormality','Normal',  'No lesions detected'),
(3,  9, 3, '2024-01-15', 'Grade 2 OA',  'Abnormal', 'Cartilage degradation visible'),
(5,  1, 5, '2024-01-20', '3.2',          'Critical', 'Leukopenia from chemo'),
(6,  9, 6, '2024-01-22', 'Ulna fracture','Abnormal', 'Clear fracture on X-ray'),
(7,  8, 1, '2024-02-08', 'AF rhythm',    'Critical', 'Irregular rhythm, start anticoag'),
(8,  1, 8, '2024-01-28', '14.5',         'Abnormal', 'Elevated WBC, signs of infection'),
(10, 2,10, '2024-02-05', '85',           'Normal',   'Fasting glucose normal in pregnancy'),
(4,  1, 4, '2024-01-18', '12.1',         'Normal',   'CBC normal for age');


-- ============================================================
-- TABLE 13: MEDICINES / INVENTORY
-- ============================================================
CREATE TABLE Medicines (
    medicine_id     INT AUTO_INCREMENT PRIMARY KEY,
    medicine_name   VARCHAR(100) NOT NULL,
    category        VARCHAR(50),
    manufacturer    VARCHAR(100),
    unit_price      DECIMAL(8,2),
    stock_quantity  INT DEFAULT 0,
    expiry_date     DATE,
    reorder_level   INT DEFAULT 50
);

INSERT INTO Medicines (medicine_name, category, manufacturer, unit_price, stock_quantity, expiry_date, reorder_level) VALUES
('Amlodipine 5mg',       'Antihypertensive', 'Sun Pharma',    12.50,  500, '2026-06-30', 100),
('Aspirin 75mg',         'Antiplatelet',     'Cipla',          5.00, 1000, '2025-12-31', 150),
('Sumatriptan 50mg',     'Antimigraine',     'Dr Reddys',     45.00,  200, '2026-03-31',  50),
('Naproxen 500mg',       'NSAID',            'Abbott',        18.00,  400, '2025-09-30',  80),
('Paracetamol 500mg',    'Analgesic',        'Cipla',          3.50, 2000, '2025-11-30', 200),
('Ondansetron 4mg',      'Antiemetic',       'GSK',           22.00,  300, '2026-01-31',  60),
('Amoxicillin 500mg',    'Antibiotic',       'Alkem',         14.00,  600, '2025-10-31', 100),
('Hydrocortisone Cream 1%','Corticosteroid', 'Pfizer',        35.00,  150, '2026-02-28',  40),
('Cetirizine 10mg',      'Antihistamine',    'Mankind',        6.00,  800, '2026-05-31', 120),
('Ferrous Sulfate 200mg','Iron Supplement',  'Emcure',         8.00,  700, '2025-08-31', 100);


-- ============================================================
-- TABLE 14: STAFF (NON-MEDICAL)
-- ============================================================
CREATE TABLE Staff (
    staff_id        INT AUTO_INCREMENT PRIMARY KEY,
    first_name      VARCHAR(50) NOT NULL,
    last_name       VARCHAR(50) NOT NULL,
    role            VARCHAR(50) NOT NULL,
    department_id   INT,
    phone           VARCHAR(15),
    email           VARCHAR(100),
    hire_date       DATE,
    salary          DECIMAL(10,2),
    shift           ENUM('Morning','Afternoon','Night'),
    FOREIGN KEY (department_id) REFERENCES Departments(department_id)
);

INSERT INTO Staff (first_name, last_name, role, department_id, phone, email, hire_date, salary, shift) VALUES
('Murugan',   'Pillai',   'Receptionist',       1, '9700001001','murugan.p@hospital.com',  '2019-01-10', 28000.00,'Morning'),
('Jaya',      'Balaji',   'Receptionist',       2, '9700001002','jaya.b@hospital.com',     '2020-05-15', 27000.00,'Afternoon'),
('Senthil',   'Kumar',    'Lab Technician',     7, '9700001003','senthil.k@hospital.com',  '2018-08-20', 35000.00,'Morning'),
('Prabhavathi','Nair',    'Pharmacist',         1, '9700001004','prabhavathi.n@hospital.com','2017-03-25',38000.00,'Morning'),
('Dinesh',    'Raj',      'Ambulance Driver',   6, '9700001005','dinesh.r@hospital.com',   '2021-11-01', 25000.00,'Night'),
('Sakthi',    'Vel',      'Security Guard',     1, '9700001006','sakthi.v@hospital.com',   '2022-02-14', 22000.00,'Night'),
('Alamelu',   'Ravi',     'Housekeeping',       3, '9700001007','alamelu.r@hospital.com',  '2023-04-05', 18000.00,'Morning'),
('Kiran',     'Mohan',    'IT Support',         1, '9700001008','kiran.m@hospital.com',    '2020-09-18', 42000.00,'Morning'),
('Valli',     'Anbu',     'Medical Records Clerk',1,'9700001009','valli.a@hospital.com',   '2019-07-22', 26000.00,'Afternoon'),
('Rajan',     'Thangam',  'Dietitian',          4, '9700001010','rajan.t@hospital.com',    '2021-06-30', 32000.00,'Morning');


-- ============================================================
-- TABLE 15: INSURANCE
-- ============================================================
CREATE TABLE Insurance (
    insurance_id    INT AUTO_INCREMENT PRIMARY KEY,
    patient_id      INT NOT NULL,
    provider_name   VARCHAR(100) NOT NULL,
    policy_number   VARCHAR(50) UNIQUE NOT NULL,
    plan_type       VARCHAR(50),
    coverage_amount DECIMAL(12,2),
    start_date      DATE,
    end_date        DATE,
    status          ENUM('Active','Expired','Claimed','Suspended') DEFAULT 'Active',
    FOREIGN KEY (patient_id) REFERENCES Patients(patient_id)
);

INSERT INTO Insurance (patient_id, provider_name, policy_number, plan_type, coverage_amount, start_date, end_date, status) VALUES
(1,  'Star Health',           'STR-001-2023', 'Family Floater',  500000.00, '2023-01-01','2024-12-31','Active'),
(2,  'New India Assurance',   'NIA-002-2023', 'Individual',      300000.00, '2023-03-01','2024-02-28','Active'),
(3,  'ICICI Lombard',         'ICL-003-2022', 'Senior Citizen',  400000.00, '2022-06-01','2024-05-31','Active'),
(4,  'HDFC Ergo',             'HDF-004-2023', 'Child Plan',      200000.00, '2023-01-15','2024-01-14','Expired'),
(5,  'Bajaj Allianz',         'BAJ-005-2021', 'Critical Illness',1000000.00,'2021-09-01','2024-08-31','Active'),
(6,  'United India',          'UNI-006-2023', 'Individual',      250000.00, '2023-05-10','2024-05-09','Claimed'),
(7,  'Max Bupa',              'MAX-007-2022', 'Family Floater',  600000.00, '2022-11-01','2024-10-31','Active'),
(8,  'Care Health',           'CAR-008-2023', 'Individual',      300000.00, '2023-07-01','2024-06-30','Active'),
(9,  'Religare',              'REL-009-2022', 'Individual',      200000.00, '2022-04-01','2024-03-31','Expired'),
(10, 'Aditya Birla Health',   'ABH-010-2023', 'Maternity Plan',  750000.00, '2023-02-01','2025-01-31','Active');


-- ============================================================
-- END OF SCRIPT
-- ============================================================
-- ============================================================
--  HEALTHCARE DB — ADVANCED SQL COMPLETE FILE
--  Topics: JOINs, Constraints, Triggers, Stored Procedures,
--          Window Functions
-- ============================================================

USE HealthcareDB;

-- ============================================================
-- SECTION 1: CONSTRAINTS (Rebuild key tables with full constraints)
-- ============================================================

-- 1A. Add CHECK constraints to existing tables

ALTER TABLE Patients
    ADD CONSTRAINT chk_gender CHECK (gender IN ('Male','Female','Other')),
    ADD CONSTRAINT chk_blood  CHECK (blood_group IN ('A+','A-','B+','B-','AB+','AB-','O+','O-'));

ALTER TABLE Doctors
    ADD CONSTRAINT chk_salary CHECK (salary > 0);

ALTER TABLE Rooms
    ADD CONSTRAINT chk_capacity    CHECK (capacity > 0),
    ADD CONSTRAINT chk_room_charge CHECK (charges_per_day >= 0);

ALTER TABLE Bills
    ADD CONSTRAINT chk_room_charges     CHECK (room_charges >= 0),
    ADD CONSTRAINT chk_doctor_charges   CHECK (doctor_charges >= 0),
    ADD CONSTRAINT chk_medicine_charges CHECK (medicine_charges >= 0),
    ADD CONSTRAINT chk_lab_charges      CHECK (lab_charges >= 0);

ALTER TABLE Medicines
    ADD CONSTRAINT chk_stock CHECK (stock_quantity >= 0),
    ADD CONSTRAINT chk_price CHECK (unit_price > 0);

ALTER TABLE Insurance
    ADD CONSTRAINT chk_coverage CHECK (coverage_amount > 0),
    ADD CONSTRAINT chk_dates    CHECK (end_date > start_date);

-- 1B. Add NOT NULL + DEFAULT constraints via table creation examples

-- Example: A new table with full constraints
CREATE TABLE IF NOT EXISTS AuditLog (
    log_id       INT AUTO_INCREMENT PRIMARY KEY,
    table_name   VARCHAR(50)  NOT NULL,
    action_type  ENUM('INSERT','UPDATE','DELETE') NOT NULL,
    performed_by VARCHAR(100) NOT NULL DEFAULT 'system',
    action_time  DATETIME     NOT NULL DEFAULT CURRENT_TIMESTAMP,
    description  TEXT
);

-- 1C. UNIQUE constraint example
ALTER TABLE Doctors
    ADD CONSTRAINT uq_doctor_phone UNIQUE (phone);


-- ============================================================
-- SECTION 2: JOINs
-- ============================================================

-- J1. INNER JOIN — Patient name + their doctor name from Appointments
SELECT
    CONCAT(p.first_name, ' ', p.last_name) AS patient_name,
    CONCAT(d.first_name, ' ', d.last_name) AS doctor_name,
    a.appointment_date,
    a.status
FROM Appointments a
INNER JOIN Patients p ON a.patient_id = p.patient_id
INNER JOIN Doctors  d ON a.doctor_id  = d.doctor_id;

-- J2. INNER JOIN — Patient + Doctor + Department from MedicalRecords
SELECT
    CONCAT(p.first_name,' ',p.last_name) AS patient_name,
    CONCAT(d.first_name,' ',d.last_name) AS doctor_name,
    dept.dept_name,
    mr.diagnosis,
    mr.visit_date
FROM MedicalRecords mr
INNER JOIN Patients    p    ON mr.patient_id    = p.patient_id
INNER JOIN Doctors     d    ON mr.doctor_id     = d.doctor_id
INNER JOIN Departments dept ON d.department_id  = dept.department_id;

-- J3. INNER JOIN — Bill details with patient name
SELECT
    CONCAT(p.first_name,' ',p.last_name) AS patient_name,
    b.bill_date,
    b.room_charges,
    b.doctor_charges,
    b.medicine_charges,
    b.total_amount,
    b.payment_status
FROM Bills b
INNER JOIN Patients p ON b.patient_id = p.patient_id;

-- J4. LEFT JOIN — All patients and their insurance (if any)
SELECT
    CONCAT(p.first_name,' ',p.last_name) AS patient_name,
    i.provider_name,
    i.policy_number,
    i.coverage_amount,
    i.status AS insurance_status
FROM Patients p
LEFT JOIN Insurance i ON p.patient_id = i.patient_id;

-- J5. LEFT JOIN — All doctors and their appointments (including doctors with no appointments)
SELECT
    CONCAT(d.first_name,' ',d.last_name) AS doctor_name,
    d.specialization,
    a.appointment_date,
    a.status
FROM Doctors d
LEFT JOIN Appointments a ON d.doctor_id = a.doctor_id
ORDER BY d.doctor_id;

-- J6. RIGHT JOIN — All rooms and their current admissions
SELECT
    r.room_number,
    r.room_type,
    r.status AS room_status,
    CONCAT(p.first_name,' ',p.last_name) AS admitted_patient
FROM Admissions a
RIGHT JOIN Rooms   r ON a.room_id    = r.room_id
LEFT  JOIN Patients p ON a.patient_id = p.patient_id;

-- J7. Multi-table JOIN — Lab results with patient, test, and doctor info
SELECT
    CONCAT(p.first_name,' ',p.last_name) AS patient_name,
    lt.test_name,
    lr.result_value,
    lr.status AS result_status,
    CONCAT(d.first_name,' ',d.last_name) AS ordered_by_doctor,
    lr.test_date
FROM LabResults lr
INNER JOIN Patients p  ON lr.patient_id = p.patient_id
INNER JOIN LabTests lt ON lr.test_id    = lt.test_id
INNER JOIN Doctors  d  ON lr.doctor_id  = d.doctor_id;

-- J8. JOIN — Prescriptions with patient, doctor, and medicine details
SELECT
    CONCAT(p.first_name,' ',p.last_name) AS patient_name,
    CONCAT(d.first_name,' ',d.last_name) AS doctor_name,
    pr.medication_name,
    pr.dosage,
    pr.frequency,
    pr.duration_days,
    pr.prescribed_date
FROM Prescriptions pr
INNER JOIN Patients p ON pr.patient_id = p.patient_id
INNER JOIN Doctors  d ON pr.doctor_id  = d.doctor_id;

-- J9. JOIN — Admission details with room and patient
SELECT
    CONCAT(p.first_name,' ',p.last_name) AS patient_name,
    r.room_number,
    r.room_type,
    a.admission_date,
    a.discharge_date,
    a.status AS admission_status,
    DATEDIFF(IFNULL(a.discharge_date, CURDATE()), a.admission_date) AS days_stayed
FROM Admissions a
INNER JOIN Patients p ON a.patient_id = p.patient_id
INNER JOIN Rooms    r ON a.room_id    = r.room_id;

-- J10. JOIN — Nurses with their department names
SELECT
    CONCAT(n.first_name,' ',n.last_name) AS nurse_name,
    n.shift,
    d.dept_name,
    d.location
FROM Nurses n
INNER JOIN Departments d ON n.department_id = d.department_id
ORDER BY d.dept_name;

-- J11. GROUP BY with JOIN — Total bills collected per department
SELECT
    dept.dept_name,
    COUNT(b.bill_id)      AS total_bills,
    SUM(b.total_amount)   AS total_revenue
FROM Bills b
INNER JOIN Patients    p    ON b.patient_id    = p.patient_id
INNER JOIN Admissions  a    ON b.admission_id  = a.admission_id
INNER JOIN Doctors     d    ON a.doctor_id     = d.doctor_id
INNER JOIN Departments dept ON d.department_id = dept.department_id
GROUP BY dept.dept_name
ORDER BY total_revenue DESC;

-- J12. HAVING with JOIN — Doctors with more than 1 completed appointment
SELECT
    CONCAT(d.first_name,' ',d.last_name) AS doctor_name,
    COUNT(a.appointment_id) AS completed_appointments
FROM Appointments a
INNER JOIN Doctors d ON a.doctor_id = d.doctor_id
WHERE a.status = 'Completed'
GROUP BY d.doctor_id, d.first_name, d.last_name
HAVING completed_appointments > 1;


-- ============================================================
-- SECTION 3: TRIGGERS
-- ============================================================

DELIMITER $$

-- T1. AFTER INSERT on Appointments — Log new appointment in AuditLog
CREATE TRIGGER trg_after_appointment_insert
AFTER INSERT ON Appointments
FOR EACH ROW
BEGIN
    INSERT INTO AuditLog (table_name, action_type, performed_by, description)
    VALUES (
        'Appointments',
        'INSERT',
        'system',
        CONCAT('New appointment added. Patient ID: ', NEW.patient_id,
               ', Doctor ID: ', NEW.doctor_id,
               ', Date: ', NEW.appointment_date)
    );
END$$

-- T2. AFTER UPDATE on Appointments — Log status change
CREATE TRIGGER trg_after_appointment_update
AFTER UPDATE ON Appointments
FOR EACH ROW
BEGIN
    IF OLD.status <> NEW.status THEN
        INSERT INTO AuditLog (table_name, action_type, performed_by, description)
        VALUES (
            'Appointments',
            'UPDATE',
            'system',
            CONCAT('Appointment ID: ', OLD.appointment_id,
                   ' status changed from ', OLD.status, ' to ', NEW.status)
        );
    END IF;
END$$

-- T3. AFTER INSERT on Admissions — Set room status to Occupied
CREATE TRIGGER trg_after_admission_insert
AFTER INSERT ON Admissions
FOR EACH ROW
BEGIN
    UPDATE Rooms
    SET status = 'Occupied'
    WHERE room_id = NEW.room_id;
END$$

-- T4. AFTER UPDATE on Admissions — Set room status to Available on discharge
CREATE TRIGGER trg_after_admission_discharge
AFTER UPDATE ON Admissions
FOR EACH ROW
BEGIN
    IF NEW.status = 'Discharged' AND OLD.status != 'Discharged' THEN
        UPDATE Rooms
        SET status = 'Available'
        WHERE room_id = NEW.room_id;

        INSERT INTO AuditLog (table_name, action_type, performed_by, description)
        VALUES (
            'Admissions',
            'UPDATE',
            'system',
            CONCAT('Patient ID: ', NEW.patient_id, ' discharged. Room ',
                   NEW.room_id, ' is now Available.')
        );
    END IF;
END$$

-- T5. BEFORE INSERT on Patients — Auto-uppercase blood group
CREATE TRIGGER trg_before_patient_insert
BEFORE INSERT ON Patients
FOR EACH ROW
BEGIN
    SET NEW.blood_group = UPPER(NEW.blood_group);
END$$

-- T6. AFTER INSERT on Bills — Log bill creation
CREATE TRIGGER trg_after_bill_insert
AFTER INSERT ON Bills
FOR EACH ROW
BEGIN
    INSERT INTO AuditLog (table_name, action_type, performed_by, description)
    VALUES (
        'Bills',
        'INSERT',
        'system',
        CONCAT('Bill ID: ', NEW.bill_id,
               ' created for Patient ID: ', NEW.patient_id,
               '. Total: ₹', NEW.total_amount)
    );
END$$

-- T7. AFTER UPDATE on Medicines — Alert when stock falls below reorder level
CREATE TRIGGER trg_medicine_low_stock
AFTER UPDATE ON Medicines
FOR EACH ROW
BEGIN
    IF NEW.stock_quantity < NEW.reorder_level THEN
        INSERT INTO AuditLog (table_name, action_type, performed_by, description)
        VALUES (
            'Medicines',
            'UPDATE',
            'system',
            CONCAT('LOW STOCK ALERT: ', NEW.medicine_name,
                   ' has only ', NEW.stock_quantity, ' units left. Reorder level: ',
                   NEW.reorder_level)
        );
    END IF;
END$$

DELIMITER ;


-- ============================================================
-- SECTION 4: STORED PROCEDURES
-- ============================================================

DELIMITER $$

-- SP1. Get all appointments for a specific patient
CREATE PROCEDURE sp_GetPatientAppointments(IN p_patient_id INT)
BEGIN
    SELECT
        a.appointment_id,
        CONCAT(d.first_name,' ',d.last_name) AS doctor_name,
        d.specialization,
        a.appointment_date,
        a.appointment_time,
        a.status,
        a.reason
    FROM Appointments a
    INNER JOIN Doctors d ON a.doctor_id = d.doctor_id
    WHERE a.patient_id = p_patient_id
    ORDER BY a.appointment_date DESC;
END$$

-- SP2. Get full medical history of a patient
CREATE PROCEDURE sp_GetPatientHistory(IN p_patient_id INT)
BEGIN
    SELECT
        mr.visit_date,
        CONCAT(d.first_name,' ',d.last_name) AS doctor_name,
        dept.dept_name,
        mr.diagnosis,
        mr.treatment,
        mr.follow_up_date
    FROM MedicalRecords mr
    INNER JOIN Doctors     d    ON mr.doctor_id    = d.doctor_id
    INNER JOIN Departments dept ON d.department_id = dept.department_id
    WHERE mr.patient_id = p_patient_id
    ORDER BY mr.visit_date DESC;
END$$

-- SP3. Register a new patient
CREATE PROCEDURE sp_RegisterPatient(
    IN p_first_name    VARCHAR(50),
    IN p_last_name     VARCHAR(50),
    IN p_dob           DATE,
    IN p_gender        ENUM('Male','Female','Other'),
    IN p_blood_group   VARCHAR(5),
    IN p_phone         VARCHAR(15),
    IN p_email         VARCHAR(100),
    IN p_address       TEXT
)
BEGIN
    INSERT INTO Patients (first_name, last_name, date_of_birth, gender,
                          blood_group, phone, email, address, registered_date)
    VALUES (p_first_name, p_last_name, p_dob, p_gender,
            p_blood_group, p_phone, p_email, p_address, CURDATE());

    SELECT LAST_INSERT_ID() AS new_patient_id,
           CONCAT(p_first_name,' ',p_last_name) AS patient_name,
           'Patient registered successfully' AS message;
END$$

-- SP4. Get department-wise doctor count and average salary
CREATE PROCEDURE sp_DepartmentSummary()
BEGIN
    SELECT
        dept.dept_name,
        COUNT(d.doctor_id)  AS total_doctors,
        ROUND(AVG(d.salary),2) AS avg_salary,
        MAX(d.salary)       AS max_salary,
        MIN(d.salary)       AS min_salary
    FROM Departments dept
    LEFT JOIN Doctors d ON dept.department_id = d.department_id
    GROUP BY dept.dept_name
    ORDER BY total_doctors DESC;
END$$

-- SP5. Calculate total bill for a patient admission
CREATE PROCEDURE sp_GetPatientBill(IN p_patient_id INT)
BEGIN
    SELECT
        CONCAT(p.first_name,' ',p.last_name) AS patient_name,
        b.bill_date,
        b.room_charges,
        b.doctor_charges,
        b.medicine_charges,
        b.lab_charges,
        b.other_charges,
        b.total_amount,
        b.payment_status
    FROM Bills b
    INNER JOIN Patients p ON b.patient_id = p.patient_id
    WHERE b.patient_id = p_patient_id;
END$$

-- SP6. Book a new appointment (with validation)
CREATE PROCEDURE sp_BookAppointment(
    IN p_patient_id INT,
    IN p_doctor_id  INT,
    IN p_date       DATE,
    IN p_time       TIME,
    IN p_reason     VARCHAR(255)
)
BEGIN
    DECLARE v_conflict INT DEFAULT 0;

    -- Check if doctor already has appointment at same date & time
    SELECT COUNT(*) INTO v_conflict
    FROM Appointments
    WHERE doctor_id = p_doctor_id
      AND appointment_date = p_date
      AND appointment_time = p_time
      AND status != 'Cancelled';

    IF v_conflict > 0 THEN
        SELECT 'ERROR: Doctor already has an appointment at this date and time.' AS message;
    ELSE
        INSERT INTO Appointments (patient_id, doctor_id, appointment_date,
                                  appointment_time, status, reason)
        VALUES (p_patient_id, p_doctor_id, p_date, p_time, 'Scheduled', p_reason);

        SELECT LAST_INSERT_ID() AS appointment_id,
               'Appointment booked successfully!' AS message;
    END IF;
END$$

-- SP7. Get all critical lab results
CREATE PROCEDURE sp_GetCriticalLabResults()
BEGIN
    SELECT
        CONCAT(p.first_name,' ',p.last_name) AS patient_name,
        lt.test_name,
        lr.result_value,
        lr.status,
        lr.remarks,
        lr.test_date,
        CONCAT(d.first_name,' ',d.last_name) AS doctor_name
    FROM LabResults lr
    INNER JOIN Patients p  ON lr.patient_id = p.patient_id
    INNER JOIN LabTests lt ON lr.test_id    = lt.test_id
    INNER JOIN Doctors  d  ON lr.doctor_id  = d.doctor_id
    WHERE lr.status = 'Critical'
    ORDER BY lr.test_date DESC;
END$$

DELIMITER ;

-- ============================================================
-- HOW TO CALL STORED PROCEDURES
-- ============================================================
-- CALL sp_GetPatientAppointments(1);
-- CALL sp_GetPatientHistory(2);
-- CALL sp_RegisterPatient('Arun','Balaji','1992-05-10','Male','B+','9888001234','arun.b@gmail.com','15 Nungambakkam, Chennai');
-- CALL sp_DepartmentSummary();
-- CALL sp_GetPatientBill(5);
-- CALL sp_BookAppointment(3, 2, '2024-03-01', '10:00:00', 'Routine checkup');
-- CALL sp_GetCriticalLabResults();


-- ============================================================
-- SECTION 5: WINDOW FUNCTIONS
-- ============================================================

-- W1. RANK — Rank doctors by salary within each department
SELECT
    CONCAT(d.first_name,' ',d.last_name) AS doctor_name,
    dept.dept_name,
    d.salary,
    RANK() OVER (PARTITION BY d.department_id ORDER BY d.salary DESC) AS salary_rank
FROM Doctors d
INNER JOIN Departments dept ON d.department_id = dept.department_id;

-- W2. DENSE_RANK — Rank patients by bill total amount
SELECT
    CONCAT(p.first_name,' ',p.last_name) AS patient_name,
    b.total_amount,
    DENSE_RANK() OVER (ORDER BY b.total_amount DESC) AS bill_rank
FROM Bills b
INNER JOIN Patients p ON b.patient_id = p.patient_id;

-- W3. ROW_NUMBER — Assign row numbers to appointments per doctor
SELECT
    ROW_NUMBER() OVER (PARTITION BY doctor_id ORDER BY appointment_date) AS row_num,
    doctor_id,
    patient_id,
    appointment_date,
    status
FROM Appointments;

-- W4. SUM — Running total of bills per patient (cumulative billing)
SELECT
    CONCAT(p.first_name,' ',p.last_name) AS patient_name,
    b.bill_date,
    b.total_amount,
    SUM(b.total_amount) OVER (
        PARTITION BY b.patient_id
        ORDER BY b.bill_date
        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) AS running_total
FROM Bills b
INNER JOIN Patients p ON b.patient_id = p.patient_id;

-- W5. AVG — Compare each doctor's salary to their department average
SELECT
    CONCAT(d.first_name,' ',d.last_name) AS doctor_name,
    dept.dept_name,
    d.salary,
    ROUND(AVG(d.salary) OVER (PARTITION BY d.department_id), 2) AS dept_avg_salary,
    ROUND(d.salary - AVG(d.salary) OVER (PARTITION BY d.department_id), 2) AS diff_from_avg
FROM Doctors d
INNER JOIN Departments dept ON d.department_id = dept.department_id;

-- W6. LAG — Compare each appointment date with the previous one for the same patient
SELECT
    patient_id,
    appointment_date,
    status,
    LAG(appointment_date) OVER (PARTITION BY patient_id ORDER BY appointment_date) AS prev_appointment,
    DATEDIFF(appointment_date,
        LAG(appointment_date) OVER (PARTITION BY patient_id ORDER BY appointment_date)
    ) AS days_since_last_visit
FROM Appointments;

-- W7. LEAD — Show next appointment date for each patient
SELECT
    patient_id,
    appointment_date,
    status,
    LEAD(appointment_date) OVER (PARTITION BY patient_id ORDER BY appointment_date) AS next_appointment
FROM Appointments;

-- W8. NTILE — Divide doctors into 3 salary tiers
SELECT
    CONCAT(first_name,' ',last_name) AS doctor_name,
    specialization,
    salary,
    NTILE(3) OVER (ORDER BY salary DESC) AS salary_tier
    -- 1 = Top tier, 2 = Mid tier, 3 = Lower tier
FROM Doctors;

-- W9. FIRST_VALUE — Show highest salary doctor in each department alongside every doctor
SELECT
    CONCAT(d.first_name,' ',d.last_name) AS doctor_name,
    dept.dept_name,
    d.salary,
    FIRST_VALUE(CONCAT(d.first_name,' ',d.last_name))
        OVER (PARTITION BY d.department_id ORDER BY d.salary DESC) AS top_earner_in_dept
FROM Doctors d
INNER JOIN Departments dept ON d.department_id = dept.department_id;

-- W10. COUNT with OVER — Total appointments per doctor shown on every row
SELECT
    CONCAT(d.first_name,' ',d.last_name) AS doctor_name,
    a.appointment_date,
    a.status,
    COUNT(a.appointment_id) OVER (PARTITION BY a.doctor_id) AS total_appointments
FROM Appointments a
INNER JOIN Doctors d ON a.doctor_id = d.doctor_id
ORDER BY d.doctor_id;

-- ============================================================
-- END OF ADVANCED SQL FILE
-- ============================================================
