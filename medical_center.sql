-- Medical Center Schema

CREATE TABLE Doctors (
    DoctorID INT PRIMARY KEY,
    Name VARCHAR(100),
    Specialty VARCHAR(100),
    ContactInfo VARCHAR(255)
);

CREATE TABLE Patients (
    PatientID INT PRIMARY KEY,
    Name VARCHAR(100),
    ContactInfo VARCHAR(255),
    MedicalHistory TEXT
);

CREATE TABLE Visits (
    VisitID INT PRIMARY KEY,
    VisitDate DATE,
    DoctorID INT,
    PatientID INT,
    Diagnosis TEXT,
    FOREIGN KEY (DoctorID) REFERENCES Doctors(DoctorID),
    FOREIGN KEY (PatientID) REFERENCES Patients(PatientID)
);

CREATE TABLE Diseases (
    DiseaseID INT PRIMARY KEY,
    Name VARCHAR(100),
    Description TEXT
);

CREATE TABLE Diagnoses (
    DiagnosisID INT PRIMARY KEY,
    VisitID INT,
    DiseaseID INT,
    FOREIGN KEY (VisitID) REFERENCES Visits(VisitID),
    FOREIGN KEY (DiseaseID) REFERENCES Diseases(DiseaseID)
);

-- Sample Data for Medical Center

INSERT INTO Doctors (DoctorID, Name, Specialty, ContactInfo) VALUES
(1, 'Dr. Smith', 'Cardiology', '123-456-7890'),
(2, 'Dr. Jones', 'Neurology', '987-654-3210');

INSERT INTO Patients (PatientID, Name, ContactInfo, MedicalHistory) VALUES
(1, 'John Doe', 'john.doe@example.com', 'No significant history'),
(2, 'Jane Smith', 'jane.smith@example.com', 'Asthma');

INSERT INTO Visits (VisitID, VisitDate, DoctorID, PatientID, Diagnosis) VALUES
(1, '2024-08-01', 1, 1, 'High blood pressure'),
(2, '2024-08-02', 2, 2, 'Migraine');

INSERT INTO Diseases (DiseaseID, Name, Description) VALUES
(1, 1, 1),
(2, 2, 2);