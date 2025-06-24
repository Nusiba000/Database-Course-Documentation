create Database task

use task

--create Table:

create table Employee(
	SSN int primary key identity(1, 1),
	SuperID int,
	FName nvarchar(10),
	LName nvarchar(10),
	BrithDate date,
	Gender nvarchar(1)
	foreign key (superID) references Employee(SSN)
);

ALTER TABLE Employee 
add BrithDate date 

drop table Employee

select * From Employee

create table Departement(
	DNum int primary key,
	DName nvarchar(10),
	SSN int,
	foreign key (SSN) references Employee(SSN),
	HireDate date
);

create table Dept_Location(
	DNum int,
	DLocation nvarchar(20),
	foreign key (DNum) references Departement(DNum),
	primary key (DNum, DLocation)
);

create table Project(
	PNum int primary key,
	DNum int,
	PName nvarchar(20),
	City nvarchar(50),
	PLocation nvarchar(100),
	foreign key (DNum) references Departement(DNum)
);

create table EmployeeDependent(
	SSN int,
	DependentName nvarchar(20),
	primary key (SSN, DependentName),
	BirthDay date,
	Gender bit default 0,
	foreign key (SSN) references Employee(SSN)
);

create table My_work(
	SSN int,
	PNum int,
	foreign key (SSN) references Employee(SSN),
	foreign key (PNum) references Project(PNum),
	Primary key (SSN, PNum),
	M_hours int check (M_hours between 0 and 24)
);


--Insert into Employee
Insert into Employee (FName, LName, BrithDate, Gender)
values ('Nusiba', 'Alnabhani', '2000-08-14', 'F'),
	  ('Hamza', 'Alsalmi', '1995-06-22', 'M'),
	  ('Sara', 'Alshekeli', '2002-07-01', 'F');

UPDATE Employee
SET SuperID = 4
WHERE SSN = 5;

UPDATE Employee
SET SuperID = 5
WHERE SSN = 6;


select * From Departement
Insert into Departement(DNum,DName, SSN, HireDate)
values (1, 'HR', NULL, '2020-01-01'),
      (2, 'IT', NULL, '2021-02-01');

select * From Dept_Location
Insert into Dept_Location(DNum,DLocation)
values (1, 'Muscat'), 
      (2, 'Sohar');

select * From Project
Insert into Project(PNum,PName, DNum, City, PLocation )
values  (100, 'ProjectA', 1, 'Muscat', 'HQ Building'),
       (101, 'ProjectB', 2, 'Salalah', 'Branch Office');

select * From EmployeeDependent
Insert into EmployeeDependent(SSN, DependentName, BirthDay, Gender)
values (4, 'Ali', '2010-04-05', 1),
	  (5, 'Laila', '2012-09-15', 0);

--Check the existing SSNs in the Employee table
select SSN From Employee

select * From My_work
Insert into My_work(SSN, PNum, M_hours)
values ( 4, 100, 23),
	  ( 5, 101, 24);


