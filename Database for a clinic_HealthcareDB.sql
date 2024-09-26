CREATE DATABASE HealthcareDB;
USE HealthcareDB;

CREATE TABLE Patients (
    PatientID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    DateOfBirth DATE,
    ContactInfo VARCHAR(100)
);

CREATE TABLE Doctors (
    DoctorID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Speciality VARCHAR(60),
    ContactInfo VARCHAR(100)
);


CREATE TABLE Appointments (
	AppointmentID INT PRIMARY KEY,
    PatientID INT NOT NULL,
    DoctorID INT NOT NULL,
    AppointmentDate DATETIME,
    FOREIGN KEY (PatientID) REFERENCES Patients(PatientID),
    FOREIGN KEY (DoctorID) REFERENCES Doctors(DoctorID)
);


    
CREATE TABLE MedicalRecords (
	RecordID INT PRIMARY KEY,
    PatientID INT NOT NULL,
    RecordDate DATE,
    Diagnosis VARCHAR(255),
    Treatment VARCHAR(255),
    FOREIGN KEY (PatientID) REFERENCES Patients(PatientID)
);

CREATE TABLE Medications (
	MedicationID INT PRIMARY KEY,
    MedicationName VARCHAR(100),
    Dosage VARCHAR(50)
);

CREATE TABLE Prescriptions (
	PrescriptionID INT PRIMARY KEY,
    PatientID INT NOT NULL,
    MedicationID INT NOT NULL,
    PrescriptionDate DATE,
    FOREIGN KEY (PatientID) REFERENCES Patients(PatientID),
    FOREIGN KEY (MedicationID) REFERENCES Medications(MedicationID)
);

INSERT INTO Patients (PatientID, FirstName, LastName, DateOfBirth, ContactInfo) 
VALUES
    (1, 'Angela', 'Morgan', '1999-05-06', 'morgan54@gmail.com, +491234848421'),
    (2, 'Roddrich', 'Alli', '2006-11-25', 'ri1chardalli@gmail.com, +491234567891'),
    (3, 'Astria', 'Soft', '2000-09-18', 'astrasoftt@gmail.com, +4988877766621'),
    (4, 'Mortell', 'Kraft', '1978-04-21', 'mortell_krafttt@gmail.com, +4958647168962'),
    (5, 'Karl', 'Snicker', '1983-12-11', 'karl_sni11cker@gmail.com, +4958647168432'),
    (6, 'Sakhar', 'Brown', '1994-02-21', 'sakharbrown01@gmail.com, +4967247168962'),
    (7, 'Stive', 'White', '1991-09-28', 'stivewhite43@gmail.com, +49586471689345'),
    (8, 'Bob', 'Fisher', '2002-12-21', 'bob33fisher@gmail.com, +4958647168888'),
    (9, 'Amir', 'Rossmann', '2003-03-05', 'amir_rossman@gmail.com, +4958647134964'),
    (10, 'Frank', 'Fiocchi', '1972-12-11', 'drfrank@gmail.com, +4952347768962'),
    (11, 'Oskar', 'Wilde', '1999-09-21', 'read_mybook@mail.com, +49586471623975'),
    (12, 'Anna', 'Kasper', '2001-01-12', 'kasper_s_krishi@mail.com, +4976208168962');

INSERT INTO Doctors (DoctorID, FirstName, LastName, Speciality, ContactInfo) 
VALUES
    (1, 'Alice', 'Snow', 'Cardiology', 'AliceSnow.doct.moriniclinic@gmail.com'),
    (2, 'Richard', 'Turgarian', 'Dermatology', 'RichardTurgarian.doct.moriniclinic@gmail.com'),
    (3, 'Aurora', 'Mitchell', 'Venerologist', 'AuroraMitchell.doct.moriniclinic@gmail.com'),
    (4, 'Bruce', 'Morini', 'Neurology', 'BruceMorini.doct.moriniclinic@gmail.com'),
    (5, 'German', 'Steir', 'Dermatology', 'GermanSteir.doct.moriniclinic@gmail.com'),
    (6, 'Cate', 'Fisher', 'Pediatrics', 'CateFisher.doct.moriniclinic@gmail.com'),
    (7, 'Nora', 'Wallter', 'Cardiology', 'NoraWallter.doct.moriniclinic@gmail.com'),
    (8, 'Monica', 'Ortmann', 'Venerologist', 'MonicaOrtmann.doct.moriniclinic@gmail.com'),
    (9, 'Michael', 'Russo', 'Oncologist', 'MichaelRusso.doct.moriniclinic@gmail.com'),
    (10, 'Simon', 'Fiocchi', 'Neurology', 'SimonFiocchi.doct.moriniclinic@gmail.com');


INSERT INTO Appointments (AppointmentID, PatientID, DoctorID, AppointmentDate) 
VALUES
    (1, 2, 2, '2024-07-19 13:00:00'),
    (2, 3, 9, '2024-07-23 11:00:00'),
    (3, 10, 4, '2024-07-23 14:00:00'),
    (4, 3, 4, '2024-07-25 11:00:00'),
    (5, 9, 9, '2024-07-26 10:30:00'),
    (6, 5, 10, '2024-08-01 10:30:00'),
    (7, 8, 7, '2024-08-02 14:30:00'),
    (8, 1, 10, '2024-08-06 09:00:00'),
    (9, 1, 6, '2024-08-07 09:00:00'),
    (10, 6, 1, '2024-08-12 09:00:00'),
    (11, 10, 7, '2024-08-13 10:30:00'),
    (12, 12, 7, '2024-08-16 11:00:00'),
    (13, 3, 9, '2024-08-19 14:30:00'),
    (14, 5, 9, '2024-08-20 11:00:00'),
    -- future appointments
    (15, 1, 10, '2024-08-27 09:00:00'),
    (16, 4, 5, '2024-08-30 11:00:00'),
    (17, 12, 3, '2024-09-02 10:30:00'),
    (18, 9, 9, '2024-09-03 14:30:00'),
    (19, 4, 2, '2024-09-03 13:00:00'),
    (20, 7, 4, '2024-09-06 13:00:00'),
    (21, 2, 2, '2024-10-24 10:30:00');
    
INSERT INTO MedicalRecords (RecordID, PatientID, RecordDate, Diagnosis, Treatment) 
VALUES
    (1, 2, '2024-07-19', 'Dermatitis', 'Topical steroids, avoid allergens'), -- (Richard Turgarian)
    (2, 3, '2024-07-23', 'Leukemia', 'Chemotherapy, regular monitoring'), -- (Michael Russo)
    (3, 10, '2024-07-23', 'Insomnia', 'Cognitive behavioral therapy, sleep hygiene'), -- (Bruce Morini)
    (4, 3, '2024-07-25', 'Migraine', 'Prescribed triptans, advised stress management'), -- (Bruce Morini)
    (5, 9, '2024-07-26', 'Lung Cancer', 'Chemotherapy, radiation therapy'), -- Врач: Онколог (Michael Russo)
    (6, 5, '2024-08-01', 'Chronic Headache', 'Pain management, stress relief exercises'), -- (Simon Fiocchi)
    (7, 8, '2024-08-02', 'Heart Arrhythmia', 'Prescribed anti-arrhythmic medication, advised lifestyle changes'), -- Nora Wallter)
    (8, 1, '2024-08-06', 'Insomnia', 'Cognitive behavioral therapy, sleep hygiene'), -- (Simon Fiocchi)
    (9, 1, '2024-08-07', 'Type 2 Diabetes', 'Metformin, dietary changes'), -- Врач: Педиатр (Cate Fisher)
    (10, 6, '2024-08-12', 'Hypertension', 'Prescribed beta-blockers, lifestyle changes recommended'), -- (Alice Snow)
    (11, 10, '2024-08-13', 'Hypertension', 'Prescribed beta-blockers, lifestyle changes recommended'), -- (Nora Wallter)
	(12, 12, '2024-08-16', 'Stenocardia', 'Prescribed nitroglycerin, lifestyle changes'), -- (Nora Wallter)
    (13, 3, '2024-08-19', 'Leukemia', 'Chemotherapy, regular monitoring'), -- (Michael Russo)
    (14, 5, '2024-08-20', 'Lung Cancer', 'Chemotherapy, radiation therapy'); -- (Michael Russo)


INSERT INTO Medications (MedicationID, MedicationName, Dosage) 
VALUES
    (1, 'Hydrocortisone Cream', '1%, twice daily for three weeks'),
    (2, 'Vincristine', 'Up to 2 mg , once a week intravenously'),
    (3, 'Doxorubicin', '10 mg, once every 3 weeks'),
    (4, 'Zolpidem', '10 mg, one pill daily before bedtime'),
    (5, 'Sumatriptan', '50 mg, as needed for migraine'),
    (6, 'Cisplatin', '70 mg, once every 3 weeks'),
    (7, 'Etoposide', '100 mg, once daily for 4 days'),
    (8, 'Atenolol', '50 mg, once daily'),
    (9, 'Sotalol', '80 mg, twice daily'),
    (10, 'Eszopiclone', '1-3 mg, once daily before bedtime'),
    (11, 'Metformin', '500 mg, twice daily'),
    (12, 'Lisinopril', '10-40 mg, once daily'),
    (13, 'Amlodipine', '50 mg, once daily'),
    (14, 'Nitroglycerin', '0.4 mg, as needed for chest pain'),
    (15, 'Cyclophosphamide', '50 mg, once daily'),
    (16, 'Cytarabine', '100-200 mg/msq, daily for 7 days'),
    (17, 'Oxaliplatin', '85 mg/msq, once every 2 weeks'),
    (18, 'Paclitaxel', ' 175 mg/msq, once every 3 weeks');


INSERT INTO Prescriptions (PrescriptionID, PatientID, MedicationID, PrescriptionDate) 
VALUES
    (1, 2, 1, '2024-07-19'),
    (2, 3, 2, '2024-07-23'),
    (3, 3, 3, '2024-07-23'),
    (4, 10, 4, '2024-07-23'),
    (5, 3, 5, '2024-07-25'),
    (6, 9, 6, '2024-07-26'),
    (7, 9, 7, '2024-07-26'),
    (8, 5, 17, '2024-08-01'),
    (9, 8, 9, '2024-08-02'),
    (10, 1, 10, '2024-08-06'),
    (11, 1, 11, '2024-08-07'),
    (12, 10, 12, '2024-08-13'),
    (13, 10, 13, '2024-08-13'),
    (14, 12, 14, '2024-08-16'),
    (15, 3, 15, '2024-08-19'),
    (16, 3, 16, '2024-08-19'),
    (17, 5, 17, '2024-08-01'),
    (18, 5, 18, '2024-08-01'); 

							-- TAsk 2.2 List all appointments for upcoming week
SELECT AppointmentID, PatientID, DoctorID, AppointmentDate FROM Appointments
WHERE AppointmentDate BETWEEN CURDATE() AND DATE_ADD(CURDATE(), INTERVAL 7 DAY);

							-- TAsk 2.3 patients with specific medication
SELECT Patients.PatientID, Patients.FirstName, Patients.LastName, Prescriptions.PrescriptionDate  FROM Prescriptions
JOIN Patients ON Prescriptions.PatientID = Patients.PatientID
JOIN Medications ON Prescriptions.MedicationID = Medications.MedicationID
WHERE Medications.MedicationName = 'Zolpidem';

							-- TAsk 2.4 all doctors and teir spwcialties
SELECT DoctorID, FirstName, LastName, Speciality FROM Doctors;

							-- TAsk 3.1 avg numb of appointments per doctor
SELECT AVG(AppointmentCount) AS AverageAppointmentsPerDoctor FROM 
	(SELECT DoctorID, COUNT(*) AS AppointmentCount FROM Appointments GROUP BY DoctorID) 
     AS DoctorAppointments;

							-- TAsk 3.2 top 3 most common medications
SELECT Medications.MedicationName, COUNT(*) AS PrescriptionCount  FROM Prescriptions
JOIN Medications ON Prescriptions.MedicationID = Medications.MedicationID
GROUP BY Medications.MedicationName
ORDER BY PrescriptionCount DESC LIMIT 3;


							-- Task 3.4 monthly report of num of new patients over the past year
CREATE TABLE RegistrationDates (
    RegistrationID INT PRIMARY KEY,
    PatientID INT NOT NULL,
    RegistrationDate DATE,
    FOREIGN KEY (PatientID) REFERENCES Patients(PatientID)
);

INSERT INTO RegistrationDates (RegistrationID, PatientID, RegistrationDate) 
VALUES
    (1, 1, '2024-01-10'),
    (2, 2, '2024-03-15'),
    (3, 3, '2024-02-20'),
    (4, 4, '2024-05-25'),
    (5, 5, '2024-07-05'),
    (6, 6, '2024-08-01'),
    (7, 7, '2024-06-10'),
    (8, 8, '2024-04-15'),
    (9, 9, '2024-06-22'),
    (10, 10, '2024-03-28'),
    (11, 11, '2024-07-01'),
    (12, 12, '2024-01-20');
    
SELECT DATE_FORMAT(RegistrationDate, '%Y-%m') AS Month, COUNT(PatientID) AS NewPatients FROM  RegistrationDates
WHERE RegistrationDate >= DATE_SUB(CURDATE(), INTERVAL 1 YEAR)
GROUP BY DATE_FORMAT(RegistrationDate, '%Y-%m')
ORDER BY Month;